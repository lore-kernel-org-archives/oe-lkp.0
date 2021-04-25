Content-Type: multipart/mixed; boundary="===============0118865341318366591=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [KVM] 4fc096a99e: kernel-selftests.kvm.set_memory_region_test.fail
Date: Sun, 25 Apr 2021 16:08:44 +0800
Message-ID: <41d6e208-1cc5-9633-fda2-232a9156a824@intel.com>
In-Reply-To: <871rb1h63v.fsf@vitty.brq.redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0118865341318366591==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 4/23/21 2:23 PM, Vitaly Kuznetsov wrote:
> kernel test robot <oliver.sang@intel.com> writes:
>
>> Greeting,
>>
>> FYI, we noticed the following commit (built with gcc-9):
>>
>> commit: 4fc096a99e01dd06dc55bef76ade7f8d76653245 ("KVM: Raise the
>> maximum number of user memslots")
> ...
>
>> # selftests: kvm: set_memory_region_test
>> # Testing KVM_RUN with zero added memory regions
>> # Allowed number of memory slots: 32764
>> # Adding slots 0..32763, each memory region with 2048K size
>> #
>> not ok 32 selftests: kvm: set_memory_region_test # TIMEOUT 120 seconds
> This is a timeout, it can be raised in
> 'tools/testing/selftests/kvm/settings'. I assume the test is running in
> a VM?
>

Hi Vitaly,

It's running in a physical Haswell machine.

Best Regards,
Rong Chen
--===============0118865341318366591==--

