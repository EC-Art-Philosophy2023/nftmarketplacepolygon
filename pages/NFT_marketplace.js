import Head from 'next/head'

import styles from '../styles/nft_marketplace.moduleNFT.css'
import 'globals.css'
export default function NFT_marketplace() {
    return (
        <div classname={styles.main}>
            <Head>
        <title>NFT_Marketplace</title>
        <meta name="description" content="A blockchain NFT_Marketplace app" />
        </Head>
        <nav className="navbar mt-4 mb-4">
            <div classname="container">
                <div className="navbar-brand">
                <h1>NFT_Marketplace</h1>
                </div>
                <div className="navbar-end">
                    <button className="button is-primary">Connect Wallet</button>
                </div>
            </div>
        </nav>
        </div>
        
    )
}