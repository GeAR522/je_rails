class RemoveWhitelistedTokensAndRefreshTokens < ActiveRecord::Migration[7.2]
  def change
    drop_table :whitelisted_tokens
    drop_table :refresh_tokens
  end
end
