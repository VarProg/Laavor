# frozen_string_literal: true

Premailer::Rails.config.merge!(preserve_styles: true, remove_ids: true)

{
  input_encoding: 'UTF-8',
  generate_text_part: true,
  strategies: %i[filesystem asset_pipeline network]
}
