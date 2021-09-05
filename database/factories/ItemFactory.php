<?php

namespace Database\Factories;

use App\Models\Item;
use Illuminate\Database\Eloquent\Factories\Factory;

class ItemFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Item::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $price = $this->faker->numberBetween($min = 500, $max = 9000);
        $origin_price = $price * 1.1;
        return [
            'category_id' => 1,
            'title' => $this->faker->word,
            'price' => $price,
            'origin_price' => $origin_price,
            'pic' => $this->faker->imageUrl($width = 640, $height = 480),
            'desc' => $this->faker->paragraph
        ];
    }
}
