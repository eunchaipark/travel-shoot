async function fetchAPI(url, options = {}) {
    try {
        const response = await fetch(`${window.API_BASE_URL}/api${url}`, {
            credentials: 'include',
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
    console.log('API 호출:', `/stays/search?${queryString}`)

    return fetchAPI(`/stays/search?${queryString}`)
}

// 자동완성 API
export async function fetchAutocomplete(keyword) {
    if (!keyword || keyword.trim().length < 1) return []

    const queryString = buildQueryString({ keyword })
    return fetchAPI(`/stays/autocomplete?${queryString}`)
}