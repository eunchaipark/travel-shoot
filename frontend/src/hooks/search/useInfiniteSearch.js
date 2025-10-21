import { useInfiniteQuery } from '@tanstack/react-query'
import { fetchInfiniteSearch } from '../../services/search/searchApiService'

export function useInfiniteSearch(searchParams, filterParams) {
    return useInfiniteQuery({
        queryKey: ['stays', searchParams, filterParams],
        queryFn: ({ pageParam = 0 }) => {
            console.log('페이지 로드:', pageParam)
            return fetchInfiniteSearch({ pageParam, searchParams, filterParams })
        },
        getNextPageParam: (lastPage) => {
            console.log('다음 페이지:', lastPage.hasNext ? lastPage.currentPage + 1 : '없음')
            return lastPage.hasNext ? lastPage.currentPage + 1 : undefined
        },
        initialPageParam: 0,
    })
}