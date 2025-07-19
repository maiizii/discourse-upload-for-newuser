# name: no-upload-for-newuser
# about: 禁止“小学生”组上传任何文件
# version: 0.1
# authors: MaiiZii

after_initialize do
  # 拦截上传控制器
  on(:before_upload_create) do |upload, user|
    if user&.groups&.any? { |g| g.name == "小学生" }
      raise Discourse::InvalidAccess, "你所在的用户组不允许上传文件"
    end
  end
end
