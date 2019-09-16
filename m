Content-Type: multipart/mixed; boundary="===============7207055120391148652=="
MIME-Version: 1.0
From: Al Viro <viro@zeniv.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: 266a9a8b41: WARNING:possible_recursive_locking_detected
Date: Mon, 16 Sep 2019 03:58:27 +0100
Message-ID: <20190916025827.GY1131@ZenIV.linux.org.uk>
In-Reply-To: <20190916020434.tutzwipgs4f6o3di@inn2.lkp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7207055120391148652==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 16, 2019 at 10:04:34AM +0800, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 266a9a8b41803281e192151ae99779a7d50fc391 ("[PATCH] Re: Possible F=
S race condition between iterate_dir and d_alloc_parallel")
> url: https://github.com/0day-ci/linux/commits/Al-Viro/Re-Possible-FS-race=
-condition-between-iterate_dir-and-d_alloc_parallel/20190915-052109
> =

> =

> in testcase: rcutorture
> with following parameters:
> =

> 	runtime: 300s
> 	test: default
> 	torture_type: srcu
> =

> test-description: rcutorture is rcutorture kernel module load/unload test.
> test-url: https://www.kernel.org/doc/Documentation/RCU/torture.txt
> =

> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 4G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):

False positive; dget() on child while holding ->d_lock on parent is OK.
We could turn that into explicit spin_lock_nested() on child + increment of
->d_count under that, but this is a pointless pessimization.  Not sure
what's the best way to tell lockdep to STFU here, but in this case it
really ought to - locking order is correct.

--===============7207055120391148652==--

