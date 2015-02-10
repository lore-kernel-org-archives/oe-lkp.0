Content-Type: multipart/mixed; boundary="===============0371033964025902731=="
MIME-Version: 1.0
From: huang ying <huang.ying.caritas@gmail.com>
To: lkp@lists.01.org
Subject: Re: [sched/core] 9edfbfed3f5: +88.2% hackbench.time.involuntary_context_switches
Date: Tue, 10 Feb 2015 08:24:58 +0800
Message-ID: <CAC=cRTOHNO2jGP0Y8F4FnW_R4mUOcP44H_Bxfh7PRoY2rasYGQ@mail.gmail.com>
In-Reply-To: <20150209092735.GP5029@twins.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============0371033964025902731==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 9, 2015 at 5:27 PM, Peter Zijlstra <peterz@infradead.org> wro=
te:

> On Mon, Feb 09, 2015 at 04:47:07PM +0800, huang ying wrote:
> > There are no distinguishable difference between the parent and the child
> > for hackbench throughput number.
> >
> > Usually you will not consider statistics such as involuntary context
> > switches?
>
> Only if there's a 'problem' with the primary performance metric (total
> runtime in case of hackbench).
>
> Once the primary metric shifts, you go look at what the cause of this
> change might be, at that point things like # context switches etc.. are
> interesting. As long as the primary performance metric is stable, meh.
>
> As such; I would suggest _always_ reporting the primary metric for each
> benchmark, preferably on top and not hidden somewhere in the mass of
> numbers.
>
> I now had to very carefully waste a few minutes of my time reading those
> numbers to see if there was anything useful in; there wasn't.
>

I see.  We will at least report primary metric and some other metrics in
subject.  Even if there is no change in primary metric, we will make it
explicit in subject.

Best Regards,
Huang, Ying

--===============0371033964025902731==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+PGRpdiBjbGFzcz0iZ21haWxfZXh0cmEiPjxkaXYgY2xhc3M9ImdtYWls
X3F1b3RlIj5PbiBNb24sIEZlYiA5LCAyMDE1IGF0IDU6MjcgUE0sIFBldGVyIFppamxzdHJhIDxz
cGFuIGRpcj0ibHRyIj4mbHQ7PGEgaHJlZj0ibWFpbHRvOnBldGVyekBpbmZyYWRlYWQub3JnIiB0
YXJnZXQ9Il9ibGFuayI+cGV0ZXJ6QGluZnJhZGVhZC5vcmc8L2E+Jmd0Ozwvc3Bhbj4gd3JvdGU6
PGJyPjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAu
OGV4O2JvcmRlci1sZWZ0OjFweCAjY2NjIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPjxzcGFuIGNs
YXNzPSIiPk9uIE1vbiwgRmViIDA5LCAyMDE1IGF0IDA0OjQ3OjA3UE0gKzA4MDAsIGh1YW5nIHlp
bmcgd3JvdGU6PGJyPgomZ3Q7IFRoZXJlIGFyZSBubyBkaXN0aW5ndWlzaGFibGUgZGlmZmVyZW5j
ZSBiZXR3ZWVuIHRoZSBwYXJlbnQgYW5kIHRoZSBjaGlsZDxicj4KJmd0OyBmb3IgaGFja2JlbmNo
IHRocm91Z2hwdXQgbnVtYmVyLjxicj4KJmd0Ozxicj4KJmd0OyBVc3VhbGx5IHlvdSB3aWxsIG5v
dCBjb25zaWRlciBzdGF0aXN0aWNzIHN1Y2ggYXMgaW52b2x1bnRhcnkgY29udGV4dDxicj4KJmd0
OyBzd2l0Y2hlcz88YnI+Cjxicj4KPC9zcGFuPk9ubHkgaWYgdGhlcmUmIzM5O3MgYSAmIzM5O3By
b2JsZW0mIzM5OyB3aXRoIHRoZSBwcmltYXJ5IHBlcmZvcm1hbmNlIG1ldHJpYyAodG90YWw8YnI+
CnJ1bnRpbWUgaW4gY2FzZSBvZiBoYWNrYmVuY2gpLjxicj4KPGJyPgpPbmNlIHRoZSBwcmltYXJ5
IG1ldHJpYyBzaGlmdHMsIHlvdSBnbyBsb29rIGF0IHdoYXQgdGhlIGNhdXNlIG9mIHRoaXM8YnI+
CmNoYW5nZSBtaWdodCBiZSwgYXQgdGhhdCBwb2ludCB0aGluZ3MgbGlrZSAjIGNvbnRleHQgc3dp
dGNoZXMgZXRjLi4gYXJlPGJyPgppbnRlcmVzdGluZy4gQXMgbG9uZyBhcyB0aGUgcHJpbWFyeSBw
ZXJmb3JtYW5jZSBtZXRyaWMgaXMgc3RhYmxlLCBtZWguPGJyPgo8YnI+CkFzIHN1Y2g7IEkgd291
bGQgc3VnZ2VzdCBfYWx3YXlzXyByZXBvcnRpbmcgdGhlIHByaW1hcnkgbWV0cmljIGZvciBlYWNo
PGJyPgpiZW5jaG1hcmssIHByZWZlcmFibHkgb24gdG9wIGFuZCBub3QgaGlkZGVuIHNvbWV3aGVy
ZSBpbiB0aGUgbWFzcyBvZjxicj4KbnVtYmVycy48YnI+Cjxicj4KSSBub3cgaGFkIHRvIHZlcnkg
Y2FyZWZ1bGx5IHdhc3RlIGEgZmV3IG1pbnV0ZXMgb2YgbXkgdGltZSByZWFkaW5nIHRob3NlPGJy
PgpudW1iZXJzIHRvIHNlZSBpZiB0aGVyZSB3YXMgYW55dGhpbmcgdXNlZnVsIGluOyB0aGVyZSB3
YXNuJiMzOTt0Ljxicj4KPC9ibG9ja3F1b3RlPjwvZGl2Pjxicj48L2Rpdj48ZGl2IGNsYXNzPSJn
bWFpbF9leHRyYSI+SSBzZWUuwqAgV2Ugd2lsbCBhdCBsZWFzdCByZXBvcnQgcHJpbWFyeSBtZXRy
aWMgYW5kIHNvbWUgb3RoZXIgbWV0cmljcyBpbiBzdWJqZWN0LsKgIEV2ZW4gaWYgdGhlcmUgaXMg
bm8gY2hhbmdlIGluIHByaW1hcnkgbWV0cmljLCB3ZSB3aWxsIG1ha2UgaXQgZXhwbGljaXQgaW4g
c3ViamVjdC48YnI+PGJyPkJlc3QgUmVnYXJkcyw8YnI+SHVhbmcsIFlpbmc8YnI+PGJyPjwvZGl2
PjwvZGl2Pgo=

--===============0371033964025902731==--

