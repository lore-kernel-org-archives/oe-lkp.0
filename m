Content-Type: multipart/mixed; boundary="===============5842460822342816255=="
MIME-Version: 1.0
From: Craig Bergstrom <craigb@google.com>
To: lkp@lists.01.org
Subject: Re: ce56a86e2a ("x86/mm: Limit mmap() of /dev/mem to valid physical addresses"): kernel BUG at arch/x86/mm/physaddr.c:79!
Date: Fri, 03 Nov 2017 13:54:14 -0600
Message-ID: <CAOJUGydv751M2p8iXHqOBEMCg5Zp2PfLZ=pzTC+nu-Qu0x5-tQ@mail.gmail.com>
In-Reply-To: <CAOJUGydTX7A=1-ZnODDJ+qAMbvFeb1TabLRKKx9BaLmDUOSj6Q@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5842460822342816255==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Just a follow up, since I said I would come back around this week.

I've come up with a couple patchsets that I'm going to attempt to test
internally before I sent out more widely.  I'm thinking it's
appropriate to mail out two changes:

 (1) Reject attempts to map physical memory addresses outside the
valid physical memory bus width of the system.  This should reject
mappings that will obviously break the page fault handler without
affecting any memory mapped devices.

 (2) Make a page fault handler that's called with a reserved bit set
kill the process instead of reboot the whole kernel. This is based on
Linus' comment "I think we might also look at just also handling the
whole RSVD page fault case more gracefully".

Standby while I test these changes.

Cheers,
Craig

On Fri, Oct 27, 2017 at 1:28 PM, Craig Bergstrom <craigb@google.com> wrot=
e:
> Sounds good.  Thanks for the context.
>
> I'll keep this on my plate and I'll turn something around once I've
> had a chance to test a bit, probably next week.
>
> On Fri, Oct 27, 2017 at 1:24 PM, Ingo Molnar <mingo@kernel.org> wrote:
>>
>> * Craig Bergstrom <craigb@google.com> wrote:
>>
>>> Reverting seems like the right approach at the moment.  My apologies
>>> for the breakage so late the in the cycle.
>>
>> Note that there's no need for you to apologize and you carry exactly zer=
o amount
>> of blame for the late-cycle breakage: it was my decision to send it to L=
inus so
>> quickly, you never asked for it to be sent upstream on such a short noti=
ce.
>>
>> ( Classic "patch makes sense, looks good, other arches ar doing this too=
, and I
>>   tested it myself too on multiple systems, so it must be obviously fine=
 for
>>   everyone" moment. )
>>
>> Your change still makes sense from a robustness POV, so please send it a=
gain with
>> the suggested fixes - and I'll be more careful with the upstream merge t=
his time.
>>
>> Thanks,
>>
>>         Ingo

--===============5842460822342816255==--

