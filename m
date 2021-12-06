Content-Type: multipart/mixed; boundary="===============7162130403373937152=="
MIME-Version: 1.0
From: Paolo Bonzini <pbonzini@redhat.com>
To: lkp@lists.01.org
Subject: Re: [KVM] d3750a0923: WARNING:possible_circular_locking_dependency_detected
Date: Mon, 06 Dec 2021 07:55:18 +0100
Message-ID: <56b9d000-8743-52cb-4f10-4d3fa2b30f29@redhat.com>
In-Reply-To: <20211205133039.GD33002@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============7162130403373937152==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 12/5/21 14:30, kernel test robot wrote:
>
> Chain exists of:
>   fs_reclaim --> mmu_notifier_invalidate_range_start --> &(kvm)->mmu_lock
>
>  Possible unsafe locking scenario:
>
>        CPU0                    CPU1
>        ----                    ----
>   lock(&(kvm)->mmu_lock);
>                                lock(mmu_notifier_invalidate_range_start);
>                                lock(&(kvm)->mmu_lock);
>   lock(fs_reclaim);
>

David, this is yours; basically, kvm_mmu_topup_memory_cache must be =

called outside the mmu_lock.

Paolo
--===============7162130403373937152==--

