CC=gcc
a:
	clang test1.c -o test1
	./test1
b:
	#clang --analyze -Xanalyzer -analyzer-checker=alpha.core.MainCall test1.c
	#clang --analyze -Xanalyzer -analyzer-checker=alpha.deadcode.UnreachableCode test1.c
	clang --analyze -Xanalyzer -analyzer-checker=alpha.core.FuncPair test1.c
c:
	clang --analyze test1.c
	scan-build -enable-checker alpha.core.MainCall -enable-checker alpha.core.FuncPair -disable-checker apiModeling.google.GTest -disable-checker core.CallAndMessage -disable-checker core.DivideZero -disable-checker core.DynamicTypePropagation  -disable-checker core.NonNullParamChecker -disable-checker core.NonnilStringConstants -disable-checker core.NullDereference -disable-checker core.StackAddressEscape -disable-checker core.UndefinedBinaryOperatorResult -disable-checker core.VLASize -disable-checker core.builtin.BuiltinFunctions -disable-checker core.builtin.NoReturnFunctions -disable-checker core.uninitialized.ArraySubscript -disable-checker core.uninitialized.Assign -disable-checker core.uninitialized.Branch -disable-checker core.uninitialized.CapturedBlockVariable -disable-checker core.uninitialized.UndefReturn -disable-checker cplusplus.NewDelete -disable-checker cplusplus.NewDeleteLeaks -disable-checker cplusplus.SelfAssignment -disable-checker deadcode.DeadStores make -j4
run:
	./test
clean:
	rm -rf test
bc:
	clang -emit-llvm test1.c -c -o test1.bc
opt:
	opt -adce < test1.bc > out.bc
