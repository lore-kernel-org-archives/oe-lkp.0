Content-Type: multipart/mixed; boundary="===============7050945957989049191=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm, vmscan] 5e56dfbd83: fsmark.files_per_sec -11.1% regression
Date: Mon, 20 Feb 2017 11:19:42 +0100
Message-ID: <20170220101942.GE2431@dhcp22.suse.cz>
In-Reply-To: <20170220014329.GH29988@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============7050945957989049191==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon 20-02-17 09:43:29, Ye Xiaolong wrote:
> On 02/19, Michal Hocko wrote:
> >On Mon 13-02-17 14:46:37, Ye Xiaolong wrote:
> >> On 02/07, Michal Hocko wrote:
> >> >On Tue 07-02-17 10:22:13, Ye Xiaolong wrote:
> >> >
> >> [snip]
> >> =

> >> >Could you retest with a single NUMA node? I am not familiar with the
> >> >benchmark enough to judge it was set up properly for a NUMA machine.
> >> =

> >> Sorry for the late, I'm not quite familiar with NUMA, could you tell m=
e how
> >> to configure a machine to use a single NUMA node? through cmdline?
> >
> >I am not aware of any parameter which would disble numa via command
> >line. You can do that when starting qemu, which I assume you are using.
> >Just configure a single memory node (-numa parameter).
> =

> Actually we were doing the test on a physical machine, not a guest.
> Any kernel config will do?

You can disbale CONFIG_NUMA. But a much better approach would be
limitting the test to a single numa node via numactl.

-- =

Michal Hocko
SUSE Labs

--===============7050945957989049191==--

