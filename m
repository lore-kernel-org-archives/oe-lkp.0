Content-Type: multipart/mixed; boundary="===============2383212544017118551=="
MIME-Version: 1.0
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: lkp@lists.01.org
Subject: Re: [drm/i915] WARNING: CPU: 3 PID: 248 at drivers/gpu/drm/i915/intel_pm.c:6427 check_power_well_state+0x60/0x90 [i915]()
Date: Wed, 30 Jul 2014 11:40:05 +0200
Message-ID: <CAKMK7uHAH5is3+CGOxTimxjx2x1auYf4gXAzWjkuTdB2mRkk-Q@mail.gmail.com>
In-Reply-To: <53D8565E.3080707@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2383212544017118551==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2014 at 4:20 AM, Aaron Lu <aaron.lu@intel.com> wrote:
> On 07/29/2014 07:10 PM, Daniel Vetter wrote:
>> On Tue, Jul 29, 2014 at 12:14 PM, Ville Syrj=C3=A4l=C3=A4
>> <ville.syrjala@linux.intel.com> wrote:
>>> On Tue, Jul 29, 2014 at 10:43:02AM +0800, Aaron Lu wrote:
>>>> FYI, we noticed the below changes on
>>>>
>>>> git://people.freedesktop.org/~danvet/drm colder-fusion
>>>
>>> Does it happen on -nightly too?
>>
>> git://anongit.freedesktop.org/drm-intel
>
> With this git tree, do we still need to watch the old one? Or they serve
> different purpose?

The old one is just my private repo, never contained official
branches. The one I've given is the official drm-intel git for
upstream.
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch

--===============2383212544017118551==--

