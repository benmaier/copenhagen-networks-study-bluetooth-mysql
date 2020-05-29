import matplotlib.pyplot as pl
import numpy as np

if __name__=="__main__":

    data = np.loadtxt('data/signal_strength_hist.tsv',skiprows=1)
    rssi = data[:,0]
    count = data[:,1]

    fig, ax = pl.subplots(2,1,figsize=(3,6))

    ax[0].plot(rssi,count)
    ax[0].set_xlabel('received signal strength')
    ax[0].set_ylabel('count')
    ax[0].set_xlim(min(rssi),0)

    ax[1].plot(rssi,np.cumsum(count))
    ax[1].set_xlabel('received signal strength')
    ax[1].set_ylabel('cumulative count')
    ax[1].set_xlim(min(rssi),0)

    fig.tight_layout()
    fig.savefig('figures/rssi_distribution.png',dpi=300)
    pl.show()

