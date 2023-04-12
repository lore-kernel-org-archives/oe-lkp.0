Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196AB3C02
	for <oe-lkp@lists.linux.dev>; Wed, 12 Apr 2023 19:34:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40FA6C433EF;
	Wed, 12 Apr 2023 19:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681328075;
	bh=/4nm7F4LngsjINMUum9DRXaP+maxw15UkV7gVW3cRK4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=qcY5jFfvoUUdOxE7wgDj+6fQTyn4fe9tRwplMqpJeCuoRMcqzRf/Xzvq1YsKwRJei
	 U21yrDNkzmBU1oMpdo2KySieiwLTpaUz5MRm3cqHxvPG2HPgmNiICK8FICz2jIWWJy
	 1TlOwAhPXrmbiP0ZEy7ZP4KA2OFVrlvXiOPMWwNMIE7r4tA9lHVP+7FHs/dYalOsRg
	 SAG5mlI5XNS7emV9+JhRHnGBE9UHLL5Ua4lNsLy3Pud2eAQnhbhP9J7X8lFejc0QKh
	 PIm3BWGqro1UVSaDkyfF6FbOD1UdGNhlSREVbzneod3/EsECvCD1F1No2yJ8+JUx6F
	 MeYvrRxJ+BMCQ==
Message-ID: <bcd5eb8bd0ae863025ced85f9d0a76eb40fa64e7.camel@kernel.org>
Subject: Re: [cel:topic-shmem-stable-dir-cookies] [shmem] 5fd403eb6c:
 WARNING:inconsistent_lock_state
From: Jeff Layton <jlayton@kernel.org>
To: Chuck Lever III <chuck.lever@oracle.com>
Cc: kernel test robot <yujie.liu@intel.com>, "oe-lkp@lists.linux.dev"
	 <oe-lkp@lists.linux.dev>, kernel test robot <lkp@intel.com>, Linux Memory
	Management List <linux-mm@kvack.org>
Date: Wed, 12 Apr 2023 15:34:33 -0400
In-Reply-To: <03D6377B-0EF1-4400-84DA-336EC7CF3BE3@oracle.com>
References: <202304101606.79aea62f-yujie.liu@intel.com>
	 <4F25D1D2-7D19-49AF-80AD-F0A87BB99681@oracle.com>
	 <033d313acfaef939fbfca9349768df34dec40d2b.camel@kernel.org>
	 <03D6377B-0EF1-4400-84DA-336EC7CF3BE3@oracle.com>
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2023-04-12 at 19:09 +0000, Chuck Lever III wrote:
>=20
> > On Apr 12, 2023, at 3:05 PM, Jeff Layton <jlayton@kernel.org> wrote:
> >=20
> > On Wed, 2023-04-12 at 18:03 +0000, Chuck Lever III wrote:
> > >=20
> > >=20
> > > > On Apr 10, 2023, at 8:36 PM, kernel test robot <yujie.liu@intel.com=
>
> > > > wrote:
> > > >=20
> > > > Hello,
> > > >=20
> > > > kernel test robot noticed "WARNING:inconsistent_lock_state" on:
> > > >=20
> > > > commit: 5fd403eb6c181c63a3aacd55d92b80256a0670cf ("shmem: stable
> > > > directory cookies")
> > > > git://git.kernel.org/cgit/linux/kernel/git/cel/linux topic-shmem-
> > > > stable-dir-cookies
> > > >=20
> > > > in testcase: boot
> > > >=20
> > > > compiler: gcc-11
> > > > test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp =
2
> > > > -m 16G
> > > >=20
> > > > (please refer to attached dmesg/kmsg for entire log/backtrace)
> > > >=20
> > > >=20
> > > > If you fix the issue, kindly add following tag
> > > > > Reported-by: kernel test robot <yujie.liu@intel.com>
> > > > > Link:
> > > > https://lore.kernel.org/oe-lkp/202304101606.79aea62f-yujie.liu@inte=
l.com
> > > >=20
> > > >=20
> > > > [   21.279213][    C0] WARNING: inconsistent lock state
> > > > [   21.279668][    C0] 6.3.0-rc5-00001-g5fd403eb6c18 #1 Not tainted
> > > > [   21.280199][    C0] --------------------------------
> > > > [   21.280657][    C0] inconsistent {SOFTIRQ-ON-W} -> {IN-SOFTIRQ-W=
}
> > > > usage.
> > > > [   21.281238][    C0] swapper/0/0 [HC0[0]:SC1[1]:HE0:SE0] takes:
> > > > [ 21.281773][ C0] ffff8881102e9b50 (&xa->xa_lock#3){+.?.}-{2:2}, at=
:
> > > > xa_destroy (lib/xarray.c:2214)
> > > > [   21.283140][    C0] {SOFTIRQ-ON-W} state was registered at:
> > > > [ 21.283640][ C0] __lock_acquire (kernel/locking/lockdep.c:5010)=
=20
> > > > [ 21.284089][ C0] lock_acquire (kernel/locking/lockdep.c:467
> > > > kernel/locking/lockdep.c:5671 kernel/locking/lockdep.c:5634)
> > > > [ 21.284513][ C0] _raw_spin_lock
> > > > (include/linux/spinlock_api_smp.h:134 kernel/locking/spinlock.c:154=
)
> > > > [ 21.284937][ C0] shmem_doff_add (include/linux/xarray.h:965
> > > > mm/shmem.c:2943)=20
> > > > [ 21.285375][ C0] shmem_mknod (mm/shmem.c:3014)=20
> > > > [ 21.285791][ C0] vfs_mknod (fs/namei.c:3916)=20
> > > > [ 21.286195][ C0] devtmpfs_work_loop (drivers/base/devtmpfs.c:228
> > > > drivers/base/devtmpfs.c:393 drivers/base/devtmpfs.c:408)
> > > > [ 21.286653][ C0] devtmpfsd (devtmpfs.c:?)=20
> > > > [ 21.287046][ C0] kthread (kernel/kthread.c:376)=20
> > > > [ 21.287441][ C0] ret_from_fork (arch/x86/entry/entry_64.S:314)=20
> > > > [   21.287864][    C0] irq event stamp: 167451
> > > > [ 21.288264][ C0] hardirqs last enabled at (167450):
> > > > kasan_quarantine_put (arch/x86/include/asm/irqflags.h:42
> > > > (discriminator 1) arch/x86/include/asm/irqflags.h:77 (discriminator
> > > > 1) arch/x86/include/asm/irqflags.h:135 (discriminator 1)
> > > > mm/kasan/quarantine.c:242 (discriminator 1))=20
> > > > [ 21.289095][ C0] hardirqs last disabled at (167451):
> > > > _raw_spin_lock_irqsave (include/linux/spinlock_api_smp.h:108
> > > > kernel/locking/spinlock.c:162)
> > > > [ 21.289969][ C0] softirqs last enabled at (167330): __do_softirq
> > > > (kernel/softirq.c:415 kernel/softirq.c:600)
> > > > [ 21.290755][ C0] softirqs last disabled at (167355): irq_exit_rcu
> > > > (kernel/softirq.c:445 kernel/softirq.c:650 kernel/softirq.c:640
> > > > kernel/softirq.c:662)
> > > > [   21.291540][    C0]
> > > > [   21.291540][    C0] other info that might help us debug this:
> > > > [   21.292230][    C0]  Possible unsafe locking scenario:
> > > > [   21.292230][    C0]
> > > > [   21.292905][    C0]        CPU0
> > > > [   21.293235][    C0]        ----
> > > > [   21.293575][    C0]   lock(&xa->xa_lock#3);
> > > > [   21.293987][    C0]   <Interrupt>
> > > > [   21.294327][    C0]     lock(&xa->xa_lock#3);
> > > > [   21.294753][    C0]
> > > > [   21.294753][    C0]  *** DEADLOCK ***
> > > > [   21.294753][    C0]
> > > > [   21.295483][    C0] 1 lock held by swapper/0/0:
> > > > [ 21.295914][ C0] #0: ffffffff8597a260 (rcu_callback){....}-{0:0},
> > > > at: rcu_do_batch (kernel/rcu/tree.c:2104)
> > >=20
> > > It appears that RCU is trying to evict a tmpfs directory inode
> > > prematurely.
> > > lockdep catches this because someone else is trying to add an entry t=
o
> > > it
> > > while RCU is trying to free it. Classic use-after-free.
> > >=20
> > > Jeff, the only new iput() in this patch is the one you suggested in
> > > shmem_symlink(). Are you sure it is needed (and also correct)?
> > >=20
> >=20
> > The code in your topic-shmem-stable-dir-cookies branch looks correct to
> > me. After shmem_get_inode, it holds an inode reference and that must be
> > explicitly put on error, unless you attach it to the dentry (via
> > d_instantiate).
> >=20
> > I'm not sure how to interpret this. The log is a bit of a mess. It look=
s
> > it ended up in some sort of recursive call into the same xarray due to
> > an interrupt?
>=20
> I think it's easier to see if you look at the dmesg.xz that was
> attached to the original report.
>=20
> The thing calling xa_destroy is being invoked from i_callback,
> which is the RCU-deferred "inode destroy" method. It's running
> in softIRQ context.
>=20

Right, but why is it trying to add an entry to an xarray that is being
destroyed? Or maybe it isn't, and lockdep is just confused and is
classifying the various per-inode xarrays together? I have a hard time
interpreting these reports sometimes. :-/

>=20
> > One thing that looks suspicious to me is that this patch has the call t=
o
> > shmem_doff_map_destroy in free_inode (which is the RCU callback). I
> > think you probably want to do that in destroy_inode instead since that
> > involves taking locks and such.
>=20
> I'll have a look!
>=20

Cool, I think that's probably safest here. In principle, the xarray
should be empty when we get to this point so there ought not be much to
do anyway.

>=20
> > I'm not sure that's enough to explain how it ended up here though.
> >=20
> >=20

--=20
Jeff Layton <jlayton@kernel.org>
