clc
%  load('imdb_crop/imdb.mat')
%  load('wiki_crop/wiki.mat')

[age_imdb,~]=datevec(datenum(imdb.photo_taken,7,1)-imdb.dob);
[age_wiki,~]=datevec(datenum(wiki.photo_taken,7,1)-wiki.dob);

imdb_size = size(age_imdb);
wiki_size = size(age_wiki);

% imdb.full_path(1:100)
% age_imdb(1:100)
% 
% wiki.full_path(1:100)
% age_wiki(1:100)

fid = fopen('imdb_wiki.csv','w');
fprintf( fid, '%s,%s\n', 'full_path','age' );
for jj = 1 : imdb_size(2)
    fprintf( fid, '%s,%d\n', strcat('imdb/',imdb.full_path{jj}), age_imdb(jj) );
end

for jj = 1 : wiki_size(2)
    fprintf( fid, '%s,%d\n', strcat('wiki/',wiki.full_path{jj}), age_wiki(jj) );
end

fclose(fid);

finish = 1
% matrix1 = {'water';'space';'fire'};
% matrix2 = [100;200;300];
% fid = fopen( 'matrix.csv', 'w' );
% for jj = 1 : length( matrix1 )
%     fprintf( fid, '%s,%d\n', matrix1{jj}, matrix2(jj) );
% end
% fclose( fid );