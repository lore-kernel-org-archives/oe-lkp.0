Content-Type: multipart/mixed; boundary="===============1300283604226895895=="
MIME-Version: 1.0
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: lkp@lists.01.org
Subject: Re: [KVM] 4fc096a99e: kernel-selftests.kvm.set_memory_region_test.fail
Date: Fri, 23 Apr 2021 08:23:16 +0200
Message-ID: <871rb1h63v.fsf@vitty.brq.redhat.com>
In-Reply-To: <20210423032514.GB13944@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============1300283604226895895==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kernel test robot <oliver.sang@intel.com> writes:

> Greeting,
>
> FYI, we noticed the following commit (built with gcc-9):
>
> commit: 4fc096a99e01dd06dc55bef76ade7f8d76653245 ("KVM: Raise the
> maximum number of user memslots")

...

> # selftests: kvm: set_memory_region_test
> # Testing KVM_RUN with zero added memory regions
> # Allowed number of memory slots: 32764
> # Adding slots 0..32763, each memory region with 2048K size
> #
> not ok 32 selftests: kvm: set_memory_region_test # TIMEOUT 120 seconds

This is a timeout, it can be raised in
'tools/testing/selftests/kvm/settings'. I assume the test is running in
a VM?

-- =

Vitaly

--===============1300283604226895895==--

