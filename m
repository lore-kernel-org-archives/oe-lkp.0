Content-Type: multipart/mixed; boundary="===============4433983661053053403=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm, vmscan] 5e56dfbd83: fsmark.files_per_sec -11.1% regression
Date: Tue, 07 Feb 2017 15:43:15 +0100
Message-ID: <20170207144315.GS5065@dhcp22.suse.cz>
In-Reply-To: <20170207022213.GC2568@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============4433983661053053403==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue 07-02-17 10:22:13, Ye Xiaolong wrote:
> On 02/06, Michal Hocko wrote:
> >On Sat 04-02-17 16:16:04, Ye Xiaolong wrote:
> >> On 01/26, Michal Hocko wrote:
> >> >On Wed 25-01-17 12:27:06, Ye Xiaolong wrote:
> >> >> On 01/24, Michal Hocko wrote:
> >[...]
> >> >> >perf profiles before and after the patch.
> >> >> =

> >> >> Here is the perf profiles, =

> >> >
> >> >I do not see any reclaim path in the profile... Could you take a
> >> >snapshot of /proc/vmstat and /proc/zoneinfo before and after the test
> >> >please?
> >> =

> >> Sorry for the late, just come back from a vacation. Proc data is attac=
hed.
> >
> >Sorry, I wasn't clear enough. Could you provide this data for both with
> >the patch applied and without, please?
> =

> Ok, please ignore previous attached proc data, you can refer to attached =
data-5e56d
> and data-69ec9 (without your patch).

Thanks!

			base		patched [diff]
allocstall_dma32	0		0
allocstall_normal	0		0
pgalloc_dma32		738043		715892
pgalloc_normal		35069802        -895825
pgscan_direct		0		0
pgscan_kswapd		6306707		12099089
pgskip_dma32		0		0
pgskip_normal		0		0
pgsteal_direct		0		0
pgsteal_kswapd		6137737		12099184

So there is no direct reclaim during the test. But there are notably
more allocations from DMA32 zone. kswapd also scans and reclaims much
more pages. We do not have per-zone counters for the reclaim so we
cannot see whether kswapd scanned DMA32 zone more. We, however, can
assume that there were unlikely GFP_DMA32 requests because we would skip
at least some pages on the LRU which we haven't.

kswapd_inodesteal	12173337	-12173337
slabs_scanned		156054		-83094

this is more interesting. It means that the the base kernel has
reclaimed a lot of inodes while the patched not a single one. This is
highly suspicious. This is a NUMA machine with 2 nodes
numa_foreign		8364077		-2819758
numa_hit		27175296        2608395
numa_local		27175860	2607766
numa_miss		8364077		-2819758
numa_other		8363513		-2819129

which suggests that the NUMA locality was much better with the patched
kernel. The broken out numbres from zoneinfo just for reference because
I do not see anything obvious from that. Well, except that the workload
was running on both nodes and the locality was better with the patched
kernel.

numa_foreign_DMA_0	0		0
numa_foreign_DMA32_0	0		0
numa_foreign_Normal_0	7177278 	-2467322
numa_foreign_Normal_1	1186799 	-352423

numa_hit_DMA32_0	731406		395905
numa_hit_Normal_0	14751993	565687
numa_hit_Normal_1	11692056	1646863

numa_local_DMA_0	0		0
numa_local_DMA32_0	731406		395905
numa_local_Normal_0	14751970	565677
numa_local_Normal_1	11692643	1646244

numa_miss_DMA_0 	0		0
numa_miss_DMA32_0	239		321811
numa_miss_Normal_0	1186560 	-674234
numa_miss_Normal_1	7177278 	-2467322

numa_other_DMA_0	0		0
numa_other_DMA32_0	239		321811
numa_other_Normal_0	1186583 	-674224
numa_other_Normal_1	7176691 	-2466703

Could you retest with a single NUMA node? I am not familiar with the
benchmark enough to judge it was set up properly for a NUMA machine.
-- =

Michal Hocko
SUSE Labs

--===============4433983661053053403==--

