gulp = require 'gulp'
connect = require 'gulp-connect'
stylus = require 'gulp-stylus'
autoprefixer = require 'gulp-autoprefixer'

gulp.task 'connect', ->
	connect.server
		port: 3000
		livereload: on
		root: './dist'

gulp.task 'stylus', (done) ->
	gulp.src 'stylus/*.styl'
		.pipe stylus(compress: on)
			.on 'error', console.log
		.pipe autoprefixer()
			.on 'error', console.log
		.pipe gulp.dest 'dist/'
		.pipe do connect.reload

gulp.task 'watch', ->
	gulp.watch 'stylus/**/*.styl', ['stylus']
	gulp.watch 'stylus/*.styl', ['stylus']

gulp.task 'default', [
	'stylus',
	'connect',
	'watch'
]