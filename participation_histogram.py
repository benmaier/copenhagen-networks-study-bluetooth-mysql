import matplotlib.pyplot as pl
import numpy as np

if __name__=="__main__":

    data = np.loadtxt('data/node_participation_ratios.tsv',skiprows=1)
    nodes = data[:,0]
    ratios = data[:,1]

    fig, ax = pl.subplots(2,1,figsize=(3,6))

    ax[0].hist(ratios,bins=101,density=True,histtype='step')
    ax[1].step(np.sort(ratios),1-np.arange(len(ratios))/len(ratios))

    ax[0].set_ylabel('probability')
    ax[1].set_ylabel('CCDF')
    ax[0].set_xlabel('participation ratio')
    ax[1].set_xlabel('participation ratio')
    fig.tight_layout()
    fig.savefig('figures/node_participation.png',dpi=300)
    pl.show()

