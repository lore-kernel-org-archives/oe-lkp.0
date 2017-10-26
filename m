Content-Type: multipart/mixed; boundary="===============7898105299483527057=="
MIME-Version: 1.0
From: Craig Bergstrom <craigb@google.com>
To: lkp@lists.01.org
Subject: Re: ce56a86e2a ("x86/mm: Limit mmap() of /dev/mem to valid physical addresses"): kernel BUG at arch/x86/mm/physaddr.c:79!
Date: Thu, 26 Oct 2017 10:35:55 -0600
Message-ID: <CAOJUGye8nXL-J9oArLLMFz-RPRdKFe6EgqtYPSr5kcWoH2EodQ@mail.gmail.com>
In-Reply-To: <8721eeac-a644-e815-55e9-5f01956dd22a@eikelenboom.it>
List-Id: <oe-lkp.lists.linux.dev>

--===============7898105299483527057==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Yes, not much time left for 4.14, it might be reasonable to pull the
change out since it's causing problems.  The 0day testing robot
failure is relatively simple (definitely aided by the reproduction
instructions), but I'm still pulling apart the qemu failure.

Another alternative that I considered when coding this up would be to
explicitly reject mmaps of pages that are greater than the bus width
of the system.  It would let through a lot more mmaps of /dev/mem that
don't point to valid addresses, but prevents the page table corruption
and seems less likely to cause problems (diff shown below).  I haven't
tested this on anything but a single 64-bit system.

Standby while I figure out what's going on with the qemu failures.



diff --git a/arch/x86/mm/mmap.c b/arch/x86/mm/mmap.c
index 320c6237e1d1..7d78ae4d0731 100644
--- a/arch/x86/mm/mmap.c
+++ b/arch/x86/mm/mmap.c
@@ -182,7 +182,11 @@ int valid_phys_addr_range(phys_addr_t addr, size_t cou=
nt)

 int valid_mmap_phys_addr_range(unsigned long pfn, size_t count)
 {
- phys_addr_t addr =3D (phys_addr_t)pfn << PAGE_SHIFT;
+ phys_addr_t addr =3D pfn << PAGE_SHIFT;

- return valid_phys_addr_range(addr, count);
+ if ((addr + count) &
+     ~(1ul << (unsigned long)boot_cpu_data.x86_phys_bits))
+ return 0;
+
+ return 1;
 }

On Thu, Oct 26, 2017@2:58 AM, Sander Eikelenboom
<linux@eikelenboom.it> wrote:
> On 26/10/17 10:12, Sander Eikelenboom wrote:
>> On 26/10/17 10:05, Sander Eikelenboom wrote:
>>> On 26/10/17 00:02, Craig Bergstrom wrote:
>>>> Thanks for the notification, my apologies for the breakage.  I'll take=
 a
>>>> close look and see if I can figure out what went wrong.
>>>>
>>>> Sander, any chance you can send /proc/iomem and the inputs to the mmap=
 call
>>>> that fail on your affected system?
>>>
>>> Hi Craig,
>>>
>>> The output from /proc/iomem is simple to get and attached.
>>> The mmap call is probably issued by qemu and will require more digging.
>>
>> Ahh grepping qemu gave a pointer, it's probably the code in:
>>
>> http://xenbits.xen.org/gitweb/?p=3Dqemu-xen.git;a=3Dblob;f=3Dhw/xen/xen_=
pt_msi.c;h=3Dff9a79f5d27ad7d74a1b22297be560feb455063c;hb=3D5cd7ce5dde3f228b=
3b669ed9ca432f588947bd40
>>
>> around line 571, that would also explain why it's only this device that
>> has the problem, since it's the only one trying to use MSI(-X)
>> interrupts. Will see it i can add some logging to that function.
>
> Attached is the qemu debug output with an extra line outputting all stuff
> used to calculate the arguments used by the mmap-call.
> --
> Sander
>
>
>> --
>> Sander
>>
>>
>>>
>>> I don't know if there is that much time left for 4.14, since we are at
>>> RC6 already.
>>>
>>> --
>>> Sander
>>>
>>>
>>>>
>>>>
>>>> On Wed, Oct 25, 2017 at 2:50 PM, Boris Ostrovsky <boris.ostrovsky@or=
acle.com
>>>>> wrote:
>>>>
>>>>> On 10/23/2017 10:44 PM, Fengguang Wu wrote:
>>>>>> Greetings,
>>>>>>
>>>>>> 0day kernel testing robot got the below dmesg and the first bad comm=
it is
>>>>>>
>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>>>>> master
>>>>>>
>>>>>> commit ce56a86e2ade45d052b3228cdfebe913a1ae7381
>>>>>> Author:     Craig Bergstrom <craigb@google.com>
>>>>>> AuthorDate: Thu Oct 19 13:28:56 2017 -0600
>>>>>> Commit:     Ingo Molnar <mingo@kernel.org>
>>>>>> CommitDate: Fri Oct 20 09:48:00 2017 +0200
>>>>>>
>>>>>>      x86/mm: Limit mmap() of /dev/mem to valid physical addresses
>>>>>
>>>>> Also note
>>>>> https://lists.xenproject.org/archives/html/xen-devel/2017-10/msg02935=
.html
>>>>>
>>>>> -boris
>>>>>
>>>>
>>>
>>
>

--===============7898105299483527057==--

