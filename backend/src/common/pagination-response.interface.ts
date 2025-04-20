export interface PaginationResponse<T> {
  data: T[];
  pagination: {
    totalItems: number;
    currentPage: number;
    totalPages: number;
    itemsPerPage: number;
    itemsOnCurrentPage: number;
  };
}