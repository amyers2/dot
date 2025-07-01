#!/usr/bin/env python3

import os
import re

def transform_line(line):
    tags = re.findall(r'#(\S+)', line)
    if tags:
        return f"`~! {' '.join(tags)}`"
    return None

def process_file(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    modified = False
    new_lines = []
    for line in lines:
        match = re.fullmatch(r'(?:#\S+\s*)+\n?', line)
        if match:
            new_line = transform_line(line)
            if new_line:
                print(f"\nFile: {filepath}")
                print(f"Original: {line.strip()}")
                print(f"Proposed: {new_line}")
                approve = input("Replace line? [y/N]: ").strip().lower()
                if approve == 'y':
                    new_lines.append(new_line + '\n')
                    modified = True
                    continue
        new_lines.append(line)

    if modified:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.writelines(new_lines)

def scan_directory(root_dir):
    for dirpath, _, filenames in os.walk(root_dir):
        for fname in filenames:
            if fname.endswith('.md'):
                process_file(os.path.join(dirpath, fname))

if __name__ == "__main__":
    directory = input("Enter the directory to scan: ").strip()
    print(f"Checking: '{directory}'")
    if os.path.isdir(directory):
        scan_directory(directory)
    else:
        print("Not a valid directory.")