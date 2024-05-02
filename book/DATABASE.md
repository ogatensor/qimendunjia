# Database Documentation 

# SQLite 
Ponder supports this for local dev

# SupabaseClient Class

The `SupabaseClient` class provides a singleton instance for interacting with the Supabase database. It offers methods for data operations and storage operations.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Methods](#methods)
  - [Data Operations](#data-operations)
  - [Storage Operations](#storage-operations)

## Installation

To use the `SupabaseClient` class, you'll need to have the Supabase client library installed in your project. You can install it using npm or yarn:

```
npm install @supabase/supabase-js
```

## Usage

To use the `SupabaseClient` class, you can get the singleton instance and call the desired methods:

```typescript
const supabaseClient = SupabaseClient.getInstance();

// Data operations
const { data, error } = await supabaseClient.fetchData();
const { error } = await supabaseClient.insertData(newData);
const { error } = await supabaseClient.updateData(id, updatedData);
const { error } = await supabaseClient.deleteData(id);

// Storage operations
const { data, error } = await supabaseClient.uploadFile(path, file);
const { data, error } = await supabaseClient.downloadFile(path);
const { data, error } = await supabaseClient.listFiles(folder, options);
```

## Methods

### Data Operations

| Method | Description | Parameters | Return Type |
| --- | --- | --- | --- |
| `fetchData()` | Fetches data from the 'countries' table. | - | `Promise<{ data: any, error: any }>` |
| `insertData(data: any)` | Inserts data into the 'countries' table. | `data: any` | `Promise<{ error: any }>` |
| `updateData(id: number, newData: any)` | Updates data in the 'countries' table. | `id: number`, `newData: any` | `Promise<{ error: any }>` |
| `deleteData(id: number)` | Deletes data from the 'countries' table. | `id: number` | `Promise<{ error: any }>` |

### Storage Operations

| Method | Description | Parameters | Return Type |
| --- | --- | --- | --- |
| `uploadFile(path: string, file: any)` | Uploads a file to the 'avatars' storage bucket. | `path: string`, `file: any` | `Promise<{ data: any, error: any }>` |
| `downloadFile(path: string)` | Downloads a file from the 'avatars' storage bucket. | `path: string` | `Promise<{ data: any, error: any }>` |
| `listFiles(folder: string, options: any)` | Lists files in the 'avatars' storage bucket. | `folder: string`, `options: any` | `Promise<{ data: any, error: any }>` |

This documentation provides an overview of the `SupabaseClient` class, including installation instructions and usage examples. The method table lists all the available methods, their parameters, and return types, making it easy to understand and use the class.
