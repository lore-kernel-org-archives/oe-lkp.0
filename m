Content-Type: multipart/mixed; boundary="===============3868793960509296485=="
MIME-Version: 1.0
From: Vlastimil Babka <vbabka@suse.cz>
To: lkp@lists.01.org
Subject: Re: [mm] 7d2eba0557: BUG: unable to handle kernel NULL pointer dereference at (null)
Date: Wed, 20 Jan 2016 00:07:46 +0100
Message-ID: <569EC1C2.1060906@suse.cz>
In-Reply-To: <20160119224536.GA2262@uranus>
List-Id: <oe-lkp.lists.linux.dev>

--===============3868793960509296485==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 01/19/2016 11:45 PM, Cyrill Gorcunov wrote:
> On Tue, Jan 19, 2016 at 02:30:45PM -0800, David Rientjes wrote:
>> On Tue, 19 Jan 2016, Cyrill Gorcunov wrote:
>> =

>> > Seems it should be something like that (untested at moment, please
>> > take a look).
>> > ---
>> > From: Cyrill Gorcunov <gorcunov@openvz.org>
>> > Subject: [PATCH] mm: Fix tracepoint for scanning pages
>> > =

>> > The page might be NULL so use page_to_pfn in conditional call.
>> > =

>> > Signed-off-by: Cyrill Gorcunov <gorcunov@openvz.org>
>> =

>> I think this is obviously correct, so
>> =

>> Acked-by: David Rientjes <rientjes@google.com>
> =

> Thank you. I've compile tested it, but didn't run.

This has been in mmotm since november:
http://ozlabs.org/~akpm/mmotm/broken-out/mm-fix-kernel-crash-in-khugepaged-=
thread.patch

Although your patch does use -1UL instead of -1 (AFAICS the only difference=
, but
it's too late here), which Steven Rostedt suggested, so it's probably bette=
r.

--===============3868793960509296485==--

