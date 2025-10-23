async function fetchAPI(url, options = {}) {
    try {
        const response = await fetch(`${window.API_BASE_URL}${url}`, {
            credentials: 'include', // 세션 쿠키 전송
            headers: {
                'Content-Type': 'application/json',
                ...options.headers,
            },
            ...options,
        })

        if (!response.ok) {
            throw new Error(`HTTP ${response.status}`)
        }

        return await response.json()
    } catch (error) {
        console.error('API 에러:', error)
        throw error
    }
}

// 쿼리 파라미터 생성
function buildQueryString(params) {
    const query = new URLSearchParams()

    Object.entries(params).forEach(([key, value]) => {
        if (value !== undefined && value !== null && value !== '') {
            if (Array.isArray(value)) {
                query.append(key, value.join(','))
            } else {
                query.append(key, String(value))
            }
        }
    })

    return query.toString()
}

// 무한스크롤 검색 API
export async function fetchInfiniteSearch({
                                              pageParam = 0,
                                              searchParams = {},
                                              filterParams = {}
                                          }) {
    const params = {
        ...searchParams,
        ...filterParams,
        page: pageParam,
        size: 20,
    }

    const queryString = buildQueryString(params)
    console.log('API 호출:', `/api/stays/search?${queryString}`)

    // /search/infinite → /stays/search 로 변경
    return fetchAPI(`/api/stays/search?${queryString}`)
}

// 자동완성 API 수정
export async function fetchAutocomplete(keyword) {
    if (!keyword || keyword.trim().length < 1) return []

    const queryString = buildQueryString({ keyword })
    // /search/autocomplete → /stays/autocomplete 로 변경
    return fetchAPI(`/api/stays/autocomplete?${queryString}`)
}