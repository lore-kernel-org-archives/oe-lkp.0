Content-Type: multipart/mixed; boundary="===============0047121675174886104=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [shmem] a067b3644b: vm-scalability.throughput -73.2% regression
Date: Mon, 09 Jul 2018 10:47:05 +0800
Message-ID: <20180709024705.GM23907@yexl-desktop>
In-Reply-To: <20180709011026.GA11700@bombadil.infradead.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============0047121675174886104==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 07/08, Matthew Wilcox wrote:
>On Wed, Jul 04, 2018 at 02:25:32PM +0800, Ye Xiaolong wrote:
>> Hi, Matthew
>> =

>> The issue should be fixed now, could you have a try?
>
>I could really use some help diagnosing this.  Is there a way to ssh
>into the lkp virtual machine while it's running, or boot it to a command
>prompt, or something else I can use to (eg) run strace?

Hi, you can use -s option to specify arbitrary ssh port when using lkp qemu=
, like

bin/lkp qemu -k <bzImage> -s <ssh_port> job-script

Then you should be able to login with:

ssh -p <ssh_port> root(a)localhost

Thanks,
Xiaolong
>
>When I boot the same kernel with the ktest system (which I do know how to
>ssh into), running usemem with the same parameters successfully forks four
>tasks.  So I'm a little stuck.

--===============0047121675174886104==--

