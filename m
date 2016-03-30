Content-Type: multipart/mixed; boundary="===============3452448134061845068=="
MIME-Version: 1.0
From: Luis R. Rodriguez <mcgrof@kernel.org>
To: lkp@lists.01.org
Subject: Re: Xen test suites - 0 day bot testing
Date: Wed, 30 Mar 2016 11:05:04 -0700
Message-ID: <CAB=NE6VJjDytgnzXcUpOuPX46J121DEktO4-gAc3hq_MPOktDw@mail.gmail.com>
In-Reply-To: <CAB=NE6XiR5RSPsim7bXrfK+r1=WmRdnE9iQ1XVRVAxwLgu853w@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3452448134061845068==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 21, 2016 at 11:17 AM, Luis R. Rodriguez
<mcgrof@do-not-panic.com> wrote:
> On Tue, Aug 25, 2015 at 1:47 PM, Fengguang Wu <fengguang.wu@intel.com> =
wrote:
>> On Tue, Aug 25, 2015 at 04:37:37PM -0400, Konrad Rzeszutek Wilk wrote:
>>> On Wed, Aug 26, 2015 at 04:29:10AM +0800, Fengguang Wu wrote:
>>> > Hi Vitaly,
>>> >
>>> > On Tue, Aug 25, 2015 at 02:11:57AM -0700, Vitaly Kuznetsov wrote:
>>> > > "Luis R. Rodriguez" <mcgrof@do-not-panic.com> writes:
>>> > >
>>> > > >> Robert Hu is from Intel VT QA team. I synced with him and it loo=
ks
>>> > > >> possible for him to bootstrap Xen from PXE, which is how 0day
>>> > > >> bootstraps Linux kernel. We rely mainly on kexec for kernel test=
ing,
>>> > > >> not sure if that's possible for Xen.
>>> > > >
>>> > > > Kexec support requires some more work, the status of which Vitaly=
 and
>>> > > > Olaf may be able to provide best.
>>> > > >
>>> > >
>>> > > (not sure which kexec was meant here: for Xen hypervisor itself, for
>>> > > hardware domain (aka Dom0) or for guest domains. In case guest kexe=
c is
>>> > > required read the below comment:)
>>> >
>>> > It is kexec support for the test target, eg. Xen hypervisor if we are
>>> > going to test/bisect it and switch among its different git commits fr=
om
>>> > time to time.
>>>
>>> It should work. Make sure you have the latest version of kexec and you
>>> build it against the version of Xen you are booting.
>>
>> That'd be great! Thanks for the info!
>
> Fengguang, curious if there was some effort in this area.
>
> Also since we have tons of test suites out there in the wild a while
> ago I had asked help by LF admins for a wiki we could use to
> centralize documentation. Projects might have their own wiki already /
> project home page, but we didn't have anything centric, we also didn't
> have a place where any test work could just create their own page
> should they want to avoid that and instead use an existing wiki. To
> help with this we now have this:
>
> https://bottest.wiki.kernel.org/
>
> If your test work has no public page it can use that. I've tried to
> document things I know of already. My understanding is zero day bot
> has no central documentation wiki, perhaps we can use that as its home
> ?

I've updated the wiki to point to the new 0-day home page but still
curious about ongoing efforts over Xen integration. I realize the task
at hand is huge undertaking -- but just curious if its on the roadmap.
Thanks so much for all your awesome work folks!

 Luis

--===============3452448134061845068==--

