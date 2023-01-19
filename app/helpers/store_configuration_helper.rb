module StoreConfigurationHelper
  def currencies
    cur = I18n.t('currencies')
    cur.sort
  end
end
