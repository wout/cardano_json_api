# Include modules and add methods that are for all API requests
abstract class ApiAction < Lucky::Action
  # APIs typically do not need to send cookie/session data.
  # Remove this line if you want to send cookies in the response header.
  disable_cookies
  accepted_formats [:json_api]

  include Api::Auth::Helpers

  # By default all actions require sign in.
  # Add 'include Api::Auth::SkipRequireAuthToken' to your actions to allow all requests.
  include Api::Auth::RequireAuthToken
  include Lucky::EnforceUnderscoredRoute
  include Lucky::Paginator::BackendHelpers

  def json_api(body, status : Int32? = nil) : Lucky::TextResponse
    send_text_response(body.to_json, "application/vnd.api+json", status)
  end
end
