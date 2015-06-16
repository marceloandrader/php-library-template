<?php

class LibraryTest extends PHPUnit_Framework_TestCase
{
    public function testConstruct()
    {
        $obj = new \MA\Library();
        $this->assertNotNull($obj);
    }
}
