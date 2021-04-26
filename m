Content-Type: multipart/mixed; boundary="===============6022080450022961022=="
MIME-Version: 1.0
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: lkp@lists.01.org
Subject: Re: [KVM] 4fc096a99e: kernel-selftests.kvm.set_memory_region_test.fail
Date: Mon, 26 Apr 2021 14:47:44 +0200
Message-ID: <87bla1fc0f.fsf@vitty.brq.redhat.com>
In-Reply-To: <41d6e208-1cc5-9633-fda2-232a9156a824@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6022080450022961022==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Rong Chen <rong.a.chen@intel.com> writes:

> On 4/23/21 2:23 PM, Vitaly Kuznetsov wrote:
>> kernel test robot <oliver.sang@intel.com> writes:
>>
>>> Greeting,
>>>
>>> FYI, we noticed the following commit (built with gcc-9):
>>>
>>> commit: 4fc096a99e01dd06dc55bef76ade7f8d76653245 ("KVM: Raise the
>>> maximum number of user memslots")
>> ...
>>
>>> # selftests: kvm: set_memory_region_test
>>> # Testing KVM_RUN with zero added memory regions
>>> # Allowed number of memory slots: 32764
>>> # Adding slots 0..32763, each memory region with 2048K size
>>> #
>>> not ok 32 selftests: kvm: set_memory_region_test # TIMEOUT 120 seconds
>> This is a timeout, it can be raised in
>> 'tools/testing/selftests/kvm/settings'. I assume the test is running in
>> a VM?
>>
>
> Hi Vitaly,
>
> It's running in a physical Haswell machine.
>

Ok, let's try to speed up the test. I'll send a patch.

-- =

Vitaly

--===============6022080450022961022==--

