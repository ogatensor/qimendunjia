// TODO: Create supabase db types from ponder schema 
import { createClient } from '@supabase/supabase-js'

// Create a single supabase client for interacting with your database
class SupabaseClient {
  private static instance: SupabaseClient | null = null;

  private constructor() {
    this.supabase = createClient('https://xyzcompany.supabase.co', 'public-anon-key');
  }

  public static getInstance(): SupabaseClient {
    if (!SupabaseClient.instance) {
      SupabaseClient.instance = new SupabaseClient();
    }
    return SupabaseClient.instance;
  }

  private supabase: any; // Define supabase property here
}

const supabaseClient = SupabaseClient.getInstance();
