function write_csv(mat,columns,filename)
T = array2table(mat);
T.Properties.VariableNames = columns;
writetable(T,filename);
