Content-Type: multipart/mixed; boundary="===============4048070227831509283=="
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
To: lkp@lists.01.org
Subject: Re: [drm/mgag200] 90f479ae51: vm-scalability.median -18.8% regression
Date: Wed, 04 Sep 2019 21:15:23 +1000
Message-ID: <CAPM=9tzDMfRf_VKaiHmnb_KKVwqW3=y=09JO0SJrG6ySe=DbfQ@mail.gmail.com>
In-Reply-To: <CAKMK7uGVKEN=pi4Erc_gtbL3ZFN-b6pm-nXSznjd_rH4H2yn4w@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4048070227831509283==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 4 Sep 2019 at 19:17, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Sep 4, 2019 at 10:35 AM Feng Tang <feng.tang@intel.com> wrote:
> >
> > Hi Daniel,
> >
> > On Wed, Sep 04, 2019 at 10:11:11AM +0200, Daniel Vetter wrote:
> > > On Wed, Sep 4, 2019 at 8:53 AM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
> > > >
> > > > Hi
> > > >
> > > > Am 04.09.19 um 08:27 schrieb Feng Tang:
> > > > >> Thank you for testing. But don't get too excited, because the pa=
tch
> > > > >> simulates a bug that was present in the original mgag200 code. A
> > > > >> significant number of frames are simply skipped. That is apparen=
tly the
> > > > >> reason why it's faster.
> > > > >
> > > > > Thanks for the detailed info, so the original code skips time-con=
suming
> > > > > work inside atomic context on purpose. Is there any space to optm=
ise it?
> > > > > If 2 scheduled update worker are handled at almost same time, can=
 one be
> > > > > skipped?
> > > >
> > > > To my knowledge, there's only one instance of the worker. Re-schedu=
ling
> > > > the worker before a previous instance started, will not create a se=
cond
> > > > instance. The worker's instance will complete all pending updates. =
So in
> > > > some way, skipping workers already happens.
> > >
> > > So I think that the most often fbcon update from atomic context is the
> > > blinking cursor. If you disable that one you should be back to the old
> > > performance level I think, since just writing to dmesg is from process
> > > context, so shouldn't change.
> >
> > Hmm, then for the old driver, it should also do the most update in
> > non-atomic context?
> >
> > One other thing is, I profiled that updating a 3MB shadow buffer needs
> > 20 ms, which transfer to 150 MB/s bandwidth. Could it be related with
> > the cache setting of DRM shadow buffer? say the orginal code use a
> > cachable buffer?
>
> Hm, that would indicate the write-combining got broken somewhere. This
> should definitely be faster. Also we shouldn't transfer the hole
> thing, except when scrolling ...

First rule of fbcon usage, you are always effectively scrolling.

Also these devices might be on a PCIE 1x piece of wet string, not sure
if the numbers reflect that.

Dave.

--===============4048070227831509283==--

