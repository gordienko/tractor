Rails.application.config.after_initialize do
    ActionText::ContentHelper.allowed_attributes.add 'target'
    ActionText::ContentHelper.allowed_attributes += %w[ target ]
end
