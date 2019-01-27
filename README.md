## 【Tool】
自分の自分による自分のための様々な物を作ってくよ！
いいですか、不定期更新不定期更新不定期更新
大事なことなので3回書きました

## 【AutoConvert.sh】
ffmpegを使った動画のエンコードを自動化するシェルです

# 使い方
# 1. 使う前に
ffmpegがインストールされていることが前提条件です

現在 mkv to mp4 しかできません(ソースちょっと書き直せばffmpegで対応している他のフォーマットでも使えます...たぶん)

# 2. ディレクトリ2つを用意
このシェルスクリプトでは2つのディレクトリが必要です

	1 ConvertDIR 	エンコードするものを入れるディレクトリ
	2 ConvertedDIR	エンコードしたものを入れるディレクトリ

# 3. ソース内の書き換え
上の2つのDIRのパスを入力してください
例
	ConvertDIR="/home/username/Convert"
  	ConvertedDIR="/home/username/Converted"

# 4. 実行
ConvertDIRの中にエンコードしたい動画を入れて以下のコマンドを実行してください
 ##### AutoConvert.sh
 			$./AutoConvert  

# 5. トラブルシューティング
 #####
		Convert_Error...ffmpegError
ffmpegで動画が正常にエンコードされていないことを表しています
動画ファイルが壊れているか、もう一度エンコードし直してください

 #####
		Convert_Error...Already_Converted
エンコードしようとしているファイル名と同じ名前のファイルがConvertedDIRに存在しています
同じ名前のファイルをConvertedDIRから削除してください

 #####
		Convert_Error...Format_Not_Supported
対応しているフォーマット以外のファイルをエンコードしようとしています
対応フォーマットを確認してください

 #####
		Convert_Error...Exception occured
スクリプトが何らかの理由で停止しました
使い方を見直してください