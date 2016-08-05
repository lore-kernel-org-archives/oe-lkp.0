Content-Type: multipart/mixed; boundary="===============6094441855109596392=="
MIME-Version: 1.0
From: Aaron Lu <aaron.lu@intel.com>
To: lkp@lists.01.org
Subject: Re: [sctp] a6c2f79287: netperf.Throughput_Mbps -37.2% regression
Date: Fri, 05 Aug 2016 11:31:09 +0800
Message-ID: <20160805033109.GA28539@aaronlu.sh.intel.com>
In-Reply-To: <CADvbK_fA=cLGz94Gd1BhR7JCHY7nzjsj7KNUfgV8d-+HqknDmA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6094441855109596392==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 28, 2016 at 03:01:36PM +0800, Xin Long wrote:
> On Wed, Jul 27, 2016 at 9:54 AM, kernel test robot
> <xiaolong.ye@intel.com> wrote:
> >
> > FYI, we noticed a -37.2% regression of netperf.Throughput_Mbps due to c=
ommit:
> >
> > commit a6c2f792873aff332a4689717c3cd6104f46684c ("sctp: implement prsct=
p TTL policy")
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git mas=
ter
> >
> > in testcase: netperf
> > on test machine: 4 threads Ivy Bridge with 8G memory
> > with following parameters:
> >
> >         ip: ipv4
> >         runtime: 300s
> >         nr_threads: 200%
> >         cluster: cs-localhost
> >         send_size: 10K
> >         test: SCTP_STREAM_MANY
> >         cpufreq_governor: performance
> >
> >
> >
> > Disclaimer:
> > Results have been estimated based on internal Intel analysis and are pr=
ovided
> > for informational purposes only. Any difference in system hardware or s=
oftware
> > design or configuration may affect actual performance.
> >
> It doesn't make much sense to me. the codes I added cannot be
> triggered without enable any pr policies. and I also did the tests in

It seems these pr policies has to be turned on by user space, i.e.
netperf in this case?

I checked netperf's source code, it doesn't seem set any option
related to SCTP PR POLICY but I'm new to network code so I could be
wrong or missing something.

> my local environment,  the result looks normal to me compare to
> prior version.

Can you share your number?
We run netperf like this:
netperf -4 -t SCTP_STREAM_MANY -c -C -l 300 -- -m 10K -H 127.0.0.1
The full log of the run is attached for your reference.

> =

> Recently the sctp performance is not stable,  as during these patches,
> netperf cannot get the result, but return ENOTCONN. which may
> also affect the testing. anyway we've fixed the -ENOTCONN issue
> already in the latest version.

I tested commit 96b585267f55, which is Linus' git tree HEAD on 08/03, I
guess the fix you mentioned should already be in there? But
unfortunately, the throughput of netperf is still at low number(we did
the test 5 times):
$ cat */netperf.json
{
  "netperf.Throughput_Mbps": [
    2470.6974999999998
  ]
}{
  "netperf.Throughput_Mbps": [
    2486.7675
  ]
}{
  "netperf.Throughput_Mbps": [
    2478.945
  ]
}{
  "netperf.Throughput_Mbps": [
    2429.465
  ]
}{
  "netperf.Throughput_Mbps": [
    2476.9150000000004
  ]

Considering what you have said that the patch shouldn't make a
difference, the performance drop is really confusing. Any idea what
could be the cause? Thanks.

Regards,
Aaron

--===============6094441855109596392==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="netperf.ksh"

MjAxNi0wOC0wNCAxNjoxMjo0MyBuZXRwZXJmIC00IC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMg
LWwgMzAwIC0tIC1tIDEwSyAtSCAxMjcuMC4wLjEgJgoyMDE2LTA4LTA0IDE2OjEyOjQzIG5ldHBl
cmYgLTQgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLIC1IIDEyNy4w
LjAuMSAmCjIwMTYtMDgtMDQgMTY6MTI6NDMgbmV0cGVyZiAtNCAtdCBTQ1RQX1NUUkVBTV9NQU5Z
IC1jIC1DIC1sIDMwMCAtLSAtbSAxMEsgLUggMTI3LjAuMC4xICYKMjAxNi0wOC0wNCAxNjoxMjo0
MyBuZXRwZXJmIC00IC10IFNDVFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSyAt
SCAxMjcuMC4wLjEgJgoyMDE2LTA4LTA0IDE2OjEyOjQzIG5ldHBlcmYgLTQgLXQgU0NUUF9TVFJF
QU1fTUFOWSAtYyAtQyAtbCAzMDAgLS0gLW0gMTBLIC1IIDEyNy4wLjAuMSAmCjIwMTYtMDgtMDQg
MTY6MTI6NDMgbmV0cGVyZiAtNCAtdCBTQ1RQX1NUUkVBTV9NQU5ZIC1jIC1DIC1sIDMwMCAtLSAt
bSAxMEsgLUggMTI3LjAuMC4xICYKMjAxNi0wOC0wNCAxNjoxMjo0MyBuZXRwZXJmIC00IC10IFND
VFBfU1RSRUFNX01BTlkgLWMgLUMgLWwgMzAwIC0tIC1tIDEwSyAtSCAxMjcuMC4wLjEgJgoyMDE2
LTA4LTA0IDE2OjEyOjQzIG5ldHBlcmYgLTQgLXQgU0NUUF9TVFJFQU1fTUFOWSAtYyAtQyAtbCAz
MDAgLS0gLW0gMTBLIC1IIDEyNy4wLjAuMSAmClNDVFAgMS1UTy1NQU5ZIFNUUkVBTSBURVNUIGZy
b20gMC4wLjAuMCAoMC4wLjAuMCkgcG9ydCAwIEFGX0lORVQgdG8gMTI3LjAuMC4xICgpIHBvcnQg
MCBBRl9JTkVUIDogZGVtbwpSZWN2ICAgU2VuZCAgICBTZW5kICAgICAgICAgICAgICAgICAgICAg
ICAgICBVdGlsaXphdGlvbiAgICAgICBTZXJ2aWNlIERlbWFuZApTb2NrZXQgU29ja2V0ICBNZXNz
YWdlICBFbGFwc2VkICAgICAgICAgICAgICBTZW5kICAgICBSZWN2ICAgICBTZW5kICAgIFJlY3YK
U2l6ZSAgIFNpemUgICAgU2l6ZSAgICAgVGltZSAgICAgVGhyb3VnaHB1dCAgbG9jYWwgICAgcmVt
b3RlICAgbG9jYWwgICByZW1vdGUKYnl0ZXMgIGJ5dGVzICAgYnl0ZXMgICAgc2Vjcy4gICAgMTBe
NmJpdHMvcyAgJSBTICAgICAgJSBTICAgICAgdXMvS0IgICB1cy9LQgoKMjEyOTkyIDIxMjk5MiAg
MTAyNDAgICAgMzAwLjAwICAgICAyMzczLjE5ICAgNTEuMTQgICAgNTEuMTQgICAgNy4wNjEgICA3
LjA2MSAKU0NUUCAxLVRPLU1BTlkgU1RSRUFNIFRFU1QgZnJvbSAwLjAuMC4wICgwLjAuMC4wKSBw
b3J0IDAgQUZfSU5FVCB0byAxMjcuMC4wLjEgKCkgcG9ydCAwIEFGX0lORVQgOiBkZW1vClJlY3Yg
ICBTZW5kICAgIFNlbmQgICAgICAgICAgICAgICAgICAgICAgICAgIFV0aWxpemF0aW9uICAgICAg
IFNlcnZpY2UgRGVtYW5kClNvY2tldCBTb2NrZXQgIE1lc3NhZ2UgIEVsYXBzZWQgICAgICAgICAg
ICAgIFNlbmQgICAgIFJlY3YgICAgIFNlbmQgICAgUmVjdgpTaXplICAgU2l6ZSAgICBTaXplICAg
ICBUaW1lICAgICBUaHJvdWdocHV0ICBsb2NhbCAgICByZW1vdGUgICBsb2NhbCAgIHJlbW90ZQpi
eXRlcyAgYnl0ZXMgICBieXRlcyAgICBzZWNzLiAgICAxMF42Yml0cy9zICAlIFMgICAgICAlIFMg
ICAgICB1cy9LQiAgIHVzL0tCCgoyMTI5OTIgMjEyOTkyICAxMDI0MCAgICAzMDAuMDAgICAgIDIz
NzQuNTkgICA1MS4xNCAgICA1MS4xMSAgICA3LjA1NyAgIDcuMDUzIApTQ1RQIDEtVE8tTUFOWSBT
VFJFQU0gVEVTVCBmcm9tIDAuMC4wLjAgKDAuMC4wLjApIHBvcnQgMCBBRl9JTkVUIHRvIDEyNy4w
LjAuMSAoKSBwb3J0IDAgQUZfSU5FVCA6IGRlbW8KUmVjdiAgIFNlbmQgICAgU2VuZCAgICAgICAg
ICAgICAgICAgICAgICAgICAgVXRpbGl6YXRpb24gICAgICAgU2VydmljZSBEZW1hbmQKU29ja2V0
IFNvY2tldCAgTWVzc2FnZSAgRWxhcHNlZCAgICAgICAgICAgICAgU2VuZCAgICAgUmVjdiAgICAg
U2VuZCAgICBSZWN2ClNpemUgICBTaXplICAgIFNpemUgICAgIFRpbWUgICAgIFRocm91Z2hwdXQg
IGxvY2FsICAgIHJlbW90ZSAgIGxvY2FsICAgcmVtb3RlCmJ5dGVzICBieXRlcyAgIGJ5dGVzICAg
IHNlY3MuICAgIDEwXjZiaXRzL3MgICUgUyAgICAgICUgUyAgICAgIHVzL0tCICAgdXMvS0IKCjIx
Mjk5MiAyMTI5OTIgIDEwMjQwICAgIDMwMC4wMCAgICAgMjYzMy4zMiAgIDUxLjE0ICAgIDUxLjEx
ICAgIDYuMzY0ICAgNi4zNjAgClNDVFAgMS1UTy1NQU5ZIFNUUkVBTSBURVNUIGZyb20gMC4wLjAu
MCAoMC4wLjAuMCkgcG9ydCAwIEFGX0lORVQgdG8gMTI3LjAuMC4xICgpIHBvcnQgMCBBRl9JTkVU
IDogZGVtbwpSZWN2ICAgU2VuZCAgICBTZW5kICAgICAgICAgICAgICAgICAgICAgICAgICBVdGls
aXphdGlvbiAgICAgICBTZXJ2aWNlIERlbWFuZApTb2NrZXQgU29ja2V0ICBNZXNzYWdlICBFbGFw
c2VkICAgICAgICAgICAgICBTZW5kICAgICBSZWN2ICAgICBTZW5kICAgIFJlY3YKU2l6ZSAgIFNp
emUgICAgU2l6ZSAgICAgVGltZSAgICAgVGhyb3VnaHB1dCAgbG9jYWwgICAgcmVtb3RlICAgbG9j
YWwgICByZW1vdGUKYnl0ZXMgIGJ5dGVzICAgYnl0ZXMgICAgc2Vjcy4gICAgMTBeNmJpdHMvcyAg
JSBTICAgICAgJSBTICAgICAgdXMvS0IgICB1cy9LQgoKMjEyOTkyIDIxMjk5MiAgMTAyNDAgICAg
MzAwLjAwICAgICAyNDI5LjcwICAgNTEuMTQgICAgNTEuMTEgICAgNi44OTcgICA2Ljg5MyAKU0NU
UCAxLVRPLU1BTlkgU1RSRUFNIFRFU1QgZnJvbSAwLjAuMC4wICgwLjAuMC4wKSBwb3J0IDAgQUZf
SU5FVCB0byAxMjcuMC4wLjEgKCkgcG9ydCAwIEFGX0lORVQgOiBkZW1vClJlY3YgICBTZW5kICAg
IFNlbmQgICAgICAgICAgICAgICAgICAgICAgICAgIFV0aWxpemF0aW9uICAgICAgIFNlcnZpY2Ug
RGVtYW5kClNvY2tldCBTb2NrZXQgIE1lc3NhZ2UgIEVsYXBzZWQgICAgICAgICAgICAgIFNlbmQg
ICAgIFJlY3YgICAgIFNlbmQgICAgUmVjdgpTaXplICAgU2l6ZSAgICBTaXplICAgICBUaW1lICAg
ICBUaHJvdWdocHV0ICBsb2NhbCAgICByZW1vdGUgICBsb2NhbCAgIHJlbW90ZQpieXRlcyAgYnl0
ZXMgICBieXRlcyAgICBzZWNzLiAgICAxMF42Yml0cy9zICAlIFMgICAgICAlIFMgICAgICB1cy9L
QiAgIHVzL0tCCgoyMTI5OTIgMjEyOTkyICAxMDI0MCAgICAzMDAuMDAgICAgIDIzOTcuODAgICA1
MS4xNCAgICA1MS4xMSAgICA2Ljk4OSAgIDYuOTg1IApTQ1RQIDEtVE8tTUFOWSBTVFJFQU0gVEVT
VCBmcm9tIDAuMC4wLjAgKDAuMC4wLjApIHBvcnQgMCBBRl9JTkVUIHRvIDEyNy4wLjAuMSAoKSBw
b3J0IDAgQUZfSU5FVCA6IGRlbW8KUmVjdiAgIFNlbmQgICAgU2VuZCAgICAgICAgICAgICAgICAg
ICAgICAgICAgVXRpbGl6YXRpb24gICAgICAgU2VydmljZSBEZW1hbmQKU29ja2V0IFNvY2tldCAg
TWVzc2FnZSAgRWxhcHNlZCAgICAgICAgICAgICAgU2VuZCAgICAgUmVjdiAgICAgU2VuZCAgICBS
ZWN2ClNpemUgICBTaXplICAgIFNpemUgICAgIFRpbWUgICAgIFRocm91Z2hwdXQgIGxvY2FsICAg
IHJlbW90ZSAgIGxvY2FsICAgcmVtb3RlCmJ5dGVzICBieXRlcyAgIGJ5dGVzICAgIHNlY3MuICAg
IDEwXjZiaXRzL3MgICUgUyAgICAgICUgUyAgICAgIHVzL0tCICAgdXMvS0IKCjIxMjk5MiAyMTI5
OTIgIDEwMjQwICAgIDMwMC4wMCAgICAgMjYxMC4zMSAgIDUxLjE0ICAgIDUxLjExICAgIDYuNDIw
ICAgNi40MTYgClNDVFAgMS1UTy1NQU5ZIFNUUkVBTSBURVNUIGZyb20gMC4wLjAuMCAoMC4wLjAu
MCkgcG9ydCAwIEFGX0lORVQgdG8gMTI3LjAuMC4xICgpIHBvcnQgMCBBRl9JTkVUIDogZGVtbwpS
ZWN2ICAgU2VuZCAgICBTZW5kICAgICAgICAgICAgICAgICAgICAgICAgICBVdGlsaXphdGlvbiAg
ICAgICBTZXJ2aWNlIERlbWFuZApTb2NrZXQgU29ja2V0ICBNZXNzYWdlICBFbGFwc2VkICAgICAg
ICAgICAgICBTZW5kICAgICBSZWN2ICAgICBTZW5kICAgIFJlY3YKU2l6ZSAgIFNpemUgICAgU2l6
ZSAgICAgVGltZSAgICAgVGhyb3VnaHB1dCAgbG9jYWwgICAgcmVtb3RlICAgbG9jYWwgICByZW1v
dGUKYnl0ZXMgIGJ5dGVzICAgYnl0ZXMgICAgc2Vjcy4gICAgMTBeNmJpdHMvcyAgJSBTICAgICAg
JSBTICAgICAgdXMvS0IgICB1cy9LQgoKMjEyOTkyIDIxMjk5MiAgMTAyNDAgICAgMzAwLjAwICAg
ICAyMzc3LjM2ICAgNTEuMTQgICAgNTEuMTEgICAgNy4wNDkgICA3LjA0NSAKU0NUUCAxLVRPLU1B
TlkgU1RSRUFNIFRFU1QgZnJvbSAwLjAuMC4wICgwLjAuMC4wKSBwb3J0IDAgQUZfSU5FVCB0byAx
MjcuMC4wLjEgKCkgcG9ydCAwIEFGX0lORVQgOiBkZW1vClJlY3YgICBTZW5kICAgIFNlbmQgICAg
ICAgICAgICAgICAgICAgICAgICAgIFV0aWxpemF0aW9uICAgICAgIFNlcnZpY2UgRGVtYW5kClNv
Y2tldCBTb2NrZXQgIE1lc3NhZ2UgIEVsYXBzZWQgICAgICAgICAgICAgIFNlbmQgICAgIFJlY3Yg
ICAgIFNlbmQgICAgUmVjdgpTaXplICAgU2l6ZSAgICBTaXplICAgICBUaW1lICAgICBUaHJvdWdo
cHV0ICBsb2NhbCAgICByZW1vdGUgICBsb2NhbCAgIHJlbW90ZQpieXRlcyAgYnl0ZXMgICBieXRl
cyAgICBzZWNzLiAgICAxMF42Yml0cy9zICAlIFMgICAgICAlIFMgICAgICB1cy9LQiAgIHVzL0tC
CgoyMTI5OTIgMjEyOTkyICAxMDI0MCAgICAzMDAuMDAgICAgIDI1NjkuMzEgICA1MS4xNCAgICA1
MS4xMSAgICA2LjUyMyAgIDYuNTE4IAo=

--===============6094441855109596392==--

