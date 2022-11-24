final class Container {
    private let fileReader = FileReader()
    private lazy var localDataSource = LocalDataSource(fileReader: fileReader)
    
    var listViewModel: ListViewModelImpl {
        ListViewModelImpl(dataSource: localDataSource)
    }
}
