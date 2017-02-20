Content-Type: multipart/mixed; boundary="===============7787784977605032934=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm, vmscan] 5e56dfbd83: fsmark.files_per_sec -11.1% regression
Date: Mon, 20 Feb 2017 09:43:29 +0800
Message-ID: <20170220014329.GH29988@yexl-desktop>
In-Reply-To: <20170219150431.GC24890@dhcp22.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============7787784977605032934==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 02/19, Michal Hocko wrote:
>On Mon 13-02-17 14:46:37, Ye Xiaolong wrote:
>> On 02/07, Michal Hocko wrote:
>> >On Tue 07-02-17 10:22:13, Ye Xiaolong wrote:
>> >
>> [snip]
>> =

>> >Could you retest with a single NUMA node? I am not familiar with the
>> >benchmark enough to judge it was set up properly for a NUMA machine.
>> =

>> Sorry for the late, I'm not quite familiar with NUMA, could you tell me =
how
>> to configure a machine to use a single NUMA node? through cmdline?
>
>I am not aware of any parameter which would disble numa via command
>line. You can do that when starting qemu, which I assume you are using.
>Just configure a single memory node (-numa parameter).

Actually we were doing the test on a physical machine, not a guest.
Any kernel config will do?

Thanks,
Xiaolong

>-- =

>Michal Hocko
>SUSE Labs

--===============7787784977605032934==--

