<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class PaginationResource extends JsonResource
{
    public function __construct($resource, private string $itemName = 'žaidimų')
    {
        parent::__construct($resource);
    }

    public function toArray(Request $request)
    {
        $lastPage = $this->lastPage();

        return [
            'from' => $this->firstItem(),
            'to' => $this->lastItem(),
            'total' => $this->total(),
            'totalLabel' => "Rasta {$this->total()} {$this->itemName}",
            'currentPage' => $this->currentPage(),
            'lastPage' => $lastPage,
            'pages' => $lastPage > 1 ? range(1, $lastPage) : [],
        ];
    }
}
