build:
	rm -rf public
	hugo

deploy:	build
	aws s3 sync public/ s3://d3ozbfgvtac8er.cloudfront.net/ --acl	public-read	--delete
	aws configure set preview.cloudfront true
	aws cloudfront create-invalidation --distribution-id E1NPZDT3656HQN --paths '/*'
