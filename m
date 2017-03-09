Content-Type: multipart/mixed; boundary="===============5417328796522504948=="
MIME-Version: 1.0
From: Daniel Borkmann <daniel@iogearbox.net>
To: lkp@lists.01.org
Subject: Re: [net/bpf] 3051bf36c2 BUG: unable to handle kernel paging request at 0000a7cf
Date: Thu, 09 Mar 2017 14:04:49 +0100
Message-ID: <58C152F1.9090004@iogearbox.net>
In-Reply-To: <CAGXu5jLm3jbJoQAsBsTiiQGK1==JTnSkN_GLsuBGqFvAz5B3AQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5417328796522504948==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 03/09/2017 06:36 AM, Kees Cook wrote:
> On Wed, Mar 8, 2017 at 3:55 PM, Laura Abbott <labbott@redhat.com> wrote:
>> On 03/08/2017 02:36 PM, Kees Cook wrote:
>>> On Wed, Mar 8, 2017 at 2:27 PM, Daniel Borkmann <daniel@iogearbox.net=
> wrote:
>>>> [   28.474232] rodata_test: test data was not read only
>>>> [...]
>>>
>>> In my tests so far, I've never been able to get rodata_test to fail
>>> (Qemu 2.5.0, Ubuntu). I'll retry with your .config and see if I can
>>> recheck under Qemu 2.7.1. Do you see these failures on real hardware?
>>>
>>> -Kees
>>
>> FWIW, I'm seeing the same issue with qemu 2.6.2 and 2.8.0 on Fedora 24
>> and rawhide respectively.
>>
>> I also notice that CONFIG_X86_PAE is turned off in the defconfig. If
>> I set CONFIG_HIGHMEM_64G which turns on CONFIG_X86_PAE the problem
>> goes away. I can't tell if this is an indication of magically hiding
>> the TLB problem or if there is an issue with !X86_PAE invalidation.
>
> I found my difference. I normally run qemu with "-cpu host" which
> makes the failure go away. With "-cpu kvm64", I see the rodata_test
> failure immediately. Seems like this may be a kvm cpu feature
> emulation bug? I'll see if I can find the specific cpu feature in the
> morning...

Interesting! Changing to "-cpu host" makes rodata_test succeed plus
my test_setmem and the test_bpf suite runs fine as well. Haven't seen
a corruption since. Switching back to "-cpu kvm64" I immediately see
mentioned issues again.

With regard to CPA_FLUSHTLB that Linus mentioned, when I investigated
code paths in change_page_attr_set_clr(), I did see that CPA_FLUSHTLB
was set each time we switched attrs and a cpa_flush_range() was
performed (with the correct number of pages and cache set to 0). That
would be a __flush_tlb_all() eventually.

Hmm, it indeed might seem likely that this could be an emulation bug.

Thanks,
Daniel

--===============5417328796522504948==--

