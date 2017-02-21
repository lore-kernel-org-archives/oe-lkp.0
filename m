Content-Type: multipart/mixed; boundary="===============4511649497829526496=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm, vmscan] 5e56dfbd83: fsmark.files_per_sec -11.1% regression
Date: Tue, 21 Feb 2017 09:10:09 +0800
Message-ID: <20170221011009.GB10024@yexl-desktop>
In-Reply-To: <20170220101942.GE2431@dhcp22.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============4511649497829526496==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 02/20, Michal Hocko wrote:
>On Mon 20-02-17 09:43:29, Ye Xiaolong wrote:
>> On 02/19, Michal Hocko wrote:
>> >On Mon 13-02-17 14:46:37, Ye Xiaolong wrote:
>> >> On 02/07, Michal Hocko wrote:
>> >> >On Tue 07-02-17 10:22:13, Ye Xiaolong wrote:
>> >> >
>> >> [snip]
>> >> =

>> >> >Could you retest with a single NUMA node? I am not familiar with the
>> >> >benchmark enough to judge it was set up properly for a NUMA machine.
>> >> =

>> >> Sorry for the late, I'm not quite familiar with NUMA, could you tell =
me how
>> >> to configure a machine to use a single NUMA node? through cmdline?
>> >
>> >I am not aware of any parameter which would disble numa via command
>> >line. You can do that when starting qemu, which I assume you are using.
>> >Just configure a single memory node (-numa parameter).
>> =

>> Actually we were doing the test on a physical machine, not a guest.
>> Any kernel config will do?
>
>You can disbale CONFIG_NUMA. But a much better approach would be
>limitting the test to a single numa node via numactl.

Thanks, numactl is supported in 0day system, I'll try it.

>
>-- =

>Michal Hocko
>SUSE Labs

--===============4511649497829526496==--

