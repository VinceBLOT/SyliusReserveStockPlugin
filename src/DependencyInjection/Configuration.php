<?php

declare(strict_types=1);

namespace Loevgaard\SyliusReserveStockPlugin\DependencyInjection;

use Symfony\Component\Config\Definition\Builder\TreeBuilder;
use Symfony\Component\Config\Definition\ConfigurationInterface;

final class Configuration implements ConfigurationInterface
{
    private const DEFAULT_TTL = 3600;

    /**
     * {@inheritdoc}
     */
    public function getConfigTreeBuilder(): TreeBuilder
    {
        $treeBuilder = new TreeBuilder();
        $rootNode = $treeBuilder->root('sylius_reserve_stock_plugin');

        $rootNode
            ->addDefaultsIfNotSet()
            ->children()
                ->integerNode('ttl')
                    ->defaultValue(self::DEFAULT_TTL)
                    ->example(1800)
                    ->info('Define the Time To Live (TTL) for a product reservation.')
                ->end()
            ->end()
        ;

        return $treeBuilder;
    }
}
