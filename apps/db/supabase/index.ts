/**
 * SupabaseClient class
 * Provides a singleton instance for interacting with the Supabase database.
 */
class SupabaseClient {
  private static instance: SupabaseClient | null = null;
  private supabase: any;

  /**
   * Private constructor to prevent direct instantiation.
   * Initializes the Supabase client using the provided environment variables.
   */
  private constructor() {
    this.supabase = createClient(process.env.SUPABASE_URL, process.env.SUPABASE_KEY);
  }

  /**
   * Gets the singleton instance of the SupabaseClient class.
   * @returns {SupabaseClient} The singleton instance of the SupabaseClient class.
   */
  public static getInstance(): SupabaseClient {
    if (!SupabaseClient.instance) {
      SupabaseClient.instance = new SupabaseClient();
    }
    return SupabaseClient.instance;
  }

  // Data Operations

  /**
   * Fetches data from the 'countries' table.
   * @returns {Promise<{ data: any, error: any }>} An object containing the fetched data and any errors.
   */
  public async fetchData() {
    const { data, error } = await this.supabase.from('countries').select();
    return { data, error };
  }

  /**
   * Inserts data into the 'countries' table.
   * @param {any} data - The data to be inserted.
   * @returns {Promise<{ error: any }>} An object containing any errors.
   */
  public async insertData(data: any) {
    const { error } = await this.supabase.from('countries').insert(data);
    return { error };
  }

  /**
   * Updates data in the 'countries' table.
   * @param {number} id - The ID of the record to be updated.
   * @param {any} newData - The new data to be used for the update.
   * @returns {Promise<{ error: any }>} An object containing any errors.
   */
  public async updateData(id: number, newData: any) {
    const { error } = await this.supabase.from('countries').update(newData).eq('id', id);
    return { error };
  }

  /**
   * Deletes data from the 'countries' table.
   * @param {number} id - The ID of the record to be deleted.
   * @returns {Promise<{ error: any }>} An object containing any errors.
   */
  public async deleteData(id: number) {
    const { error } = await this.supabase.from('countries').delete().eq('id', id);
    return { error };
  }

  // Storage Operations

  /**
   * Uploads a file to the 'avatars' storage bucket.
   * @param {string} path - The path to upload the file to.
   * @param {any} file - The file to be uploaded.
   * @returns {Promise<{ data: any, error: any }>} An object containing the upload data and any errors.
   */
  public async uploadFile(path: string, file: any) {
    const { data, error } = await this.supabase.storage.from('avatars').upload(path, file);
    return { data, error };
  }

  /**
   * Downloads a file from the 'avatars' storage bucket.
   * @param {string} path - The path of the file to be downloaded.
   * @returns {Promise<{ data: any, error: any }>} An object containing the downloaded data and any errors.
   */
  public async downloadFile(path: string) {
    const { data, error } = await this.supabase.storage.from('avatars').download(path);
    return { data, error };
  }

  /**
   * Lists files in the 'avatars' storage bucket.
   * @param {string} folder - The folder to list the files from.
   * @param {any} options - Additional options for the list operation.
   * @returns {Promise<{ data: any, error: any }>} An object containing the list of files and any errors.
   */
  public async listFiles(folder: string, options: any) {
    const { data, error } = await this.supabase.storage.from('avatars').list(folder, options);
    return { data, error };
  }
}