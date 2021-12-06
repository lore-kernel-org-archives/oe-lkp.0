Content-Type: multipart/mixed; boundary="===============7864142216678641616=="
MIME-Version: 1.0
From: David Matlack <dmatlack@google.com>
To: lkp@lists.01.org
Subject: Re: [KVM] d3750a0923: WARNING:possible_circular_locking_dependency_detected
Date: Mon, 06 Dec 2021 09:19:52 -0800
Message-ID: <CALzav=dn-Oe1v9qTp=ag92Kn96JOb3AX9JJA4P5VcLksV8-vLw@mail.gmail.com>
In-Reply-To: <56b9d000-8743-52cb-4f10-4d3fa2b30f29@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7864142216678641616==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 5, 2021 at 10:55 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 12/5/21 14:30, kernel test robot wrote:
> >
> > Chain exists of:
> >   fs_reclaim --> mmu_notifier_invalidate_range_start --> &(kvm)->mmu_lo=
ck
> >
> >  Possible unsafe locking scenario:
> >
> >        CPU0                    CPU1
> >        ----                    ----
> >   lock(&(kvm)->mmu_lock);
> >                                lock(mmu_notifier_invalidate_range_start=
);
> >                                lock(&(kvm)->mmu_lock);
> >   lock(fs_reclaim);
> >
>
> David, this is yours; basically, kvm_mmu_topup_memory_cache must be
> called outside the mmu_lock.

Ah, I see. kvm_arch_mmu_enable_log_dirty_pt_masked is called with
mmu_lock already held. I'll make sure to address this in v1. In theory
this should just go away when I switch away from using split_caches to
Sean's suggestion of allocating under the mmu_lock with reclaim
disabled.
--===============7864142216678641616==--

