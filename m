Content-Type: multipart/mixed; boundary="===============6392267801888039390=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/hweight] 65ea11ec6a: will-it-scale.per_process_ops 9.3% improvement
Date: Wed, 17 Aug 2016 15:29:04 -0700
Message-ID: <87r39n58sv.fsf@yhuang-mobile.sh.intel.com>
In-Reply-To: <20160817054605.GA6728@nazgul.tnic>
List-Id: <oe-lkp.lists.linux.dev>

--===============6392267801888039390==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Borislav Petkov <bp@suse.de> writes:

> On Tue, Aug 16, 2016 at 04:09:19PM -0700, H. Peter Anvin wrote:
>> On August 16, 2016 10:16:35 AM PDT, Borislav Petkov <bp@suse.de> wrote:
>> >On Tue, Aug 16, 2016 at 09:59:00AM -0700, H. Peter Anvin wrote:
>> >> Dang...
>> >
>> >Isn't 9.3% improvement a good thing(tm) ?
>> =

>> Yes, it's huge.  The only explanation I could imagine is that scrambling=
 %rdi caused the scheduler to do completely the wrong thing.
>
> I'm questioning the validity, actually. Report says test machine was
> Sandy Bridge-EP and I'd bet good money this one has POPCNT support so
> how are we even hitting that __sw_hweight64() path, at all?

We done 8 tests for the base and 4 tests for the head, and the result is
quite stable.

I found there is another change between the two comments,

base:

  "perf-stat.branch-miss-rate": [
    0.3089533646503185,
    0.3099821038600304,
    0.3123762964028104,
    0.311511881793534,
    0.31231973343587144,
    0.3096478429327263,
    0.31166037272389924,
    0.3097364392684626
  ],

first bad commit:

  "perf-stat.branch-miss-rate": [
    0.039853905034485354,
    0.0402472142423231,
    0.04380682345704418,
    0.04319082390667179
  ],

branch-miss-rate decreased from ~0.30% to ~0.043%.

So I guess there are some code alignment change, which caused decreased
branch miss rate.

Best Regards,
Huang, Ying

--===============6392267801888039390==--

