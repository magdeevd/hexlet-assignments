require "test_helper"

class BulletinsControllerTest < ActionDispatch::IntegrationTest
  # Rails автоматически используют транзакционные тесты
  # self.use_transactional_tests = false
  test 'opens bulletins page' do
    get bulletins_url
    assert_response :success
    assert_select 'h1', 'Bulletins'
  end

  test 'opens one bulletin page' do
    bulletin = bulletins(:one)
    get bulletin_url(bulletin)
    assert_response :success
    assert_select 'h1', 'Bulletin page'
    assert_select 'h4', 'Title 1'
    assert_select 'p', 'Body 1'
  end
end