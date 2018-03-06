<?php

use PHPUnit\Framework\TestCase;

class SampleTest extends TestCase
{
    public function testHello()
    {
        $this->assertTrue(1 === 1);
        $this->assertFalse(1 === '1');
    }
}
