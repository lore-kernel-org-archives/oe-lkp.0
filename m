Content-Type: multipart/mixed; boundary="===============2255905146384404026=="
MIME-Version: 1.0
From: Jirka Hladky <jhladky@redhat.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [xfs] b027d4c97b: fio.latency_2ms% +7.1% regression
Date: Fri, 08 Jun 2018 15:30:47 +0200
Message-ID: <CAE4VaGA4MwutatZpWNLtraGdBMEnkuyEV2tOd84SdGw9kJKjrA@mail.gmail.com>
In-Reply-To: <20180606014028.GQ16472@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============2255905146384404026==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Adding kernel-perf-qe(a)redhat.com on Cc.

@Xiaolong - could you please add "kernel-perf-qe(a)redhat.com" on Cc of the
similar announcements?

Jirka

On Wed, Jun 6, 2018 at 3:40 AM, Ye Xiaolong <xiaolong.ye@intel.com> wrote:

> On 06/06, Dave Chinner wrote:
> >On Tue, Jun 05, 2018 at 03:16:57PM +0800, kernel test robot wrote:
> >>
> >> Greeting,
> >>
> >> FYI, we noticed a +7.1%% regression of fio.latency_2ms% due to commit:
> >>
> >>
> >> commit: b027d4c97b9675c2ad75dec94be4e46dceb3ec74 ("xfs: don't retry
> xfs_buf_find on XBF_TRYLOCK failure")
> >> https://git.kernel.org/cgit/fs/xfs/xfs-linux.git xfs-4.18-merge
> >....
> >> 8925a3dc4771004b b027d4c97b9675c2ad75dec94b
> >> ---------------- --------------------------
> >>          %stddev     %change         %stddev
> >>              \          |                \
> >>      46.56 =C4=85  3%      +7.1       53.61        fio.latency_2ms%
> >>       8.19            +0.2        8.40        fio.latency_100ms%
> >>       0.74 =C4=85  3%      -0.1        0.68 =C4=85  6%  fio.latency_25=
0ms%
> >>      25.20 =C4=85  6%      -7.3       17.86 =C4=85  6%  fio.latency_4m=
s%
> >>       0.46 =C4=85  9%      +0.2        0.69 =C4=85 13%  fio.latency_75=
0us%
> >
> >This is not a regression. The number of IOs in the 4ms IO latency
> >bin has reduced by 7%, and inumber in the 2ms IO latency bin has
> >increased by 7%. IOWs, there's a measurable improvement in IO
> >latency as a result of those patches, not a regression.
>
> Thanks for clarification.
>
> Thanks,
> Xiaolong
>
> >
> >Cheers,
> >
> >Dave.
> >--
> >Dave Chinner
> >david(a)fromorbit.com
>

--===============2255905146384404026==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGRpdiBkaXI9Imx0ciI+QWRkaW5nwqA8YSBocmVmPSJtYWlsdG86a2VybmVsLXBlcmYtcWVAcmVk
aGF0LmNvbSI+a2VybmVsLXBlcmYtcWVAcmVkaGF0LmNvbTwvYT4gb24gQ2MuPGRpdj48YnI+PC9k
aXY+PGRpdj5AWGlhb2xvbmcgLSBjb3VsZCB5b3UgcGxlYXNlIGFkZCAmcXVvdDs8YSBocmVmPSJt
YWlsdG86a2VybmVsLXBlcmYtcWVAcmVkaGF0LmNvbSI+a2VybmVsLXBlcmYtcWVAcmVkaGF0LmNv
bTwvYT4mcXVvdDsgb24gQ2Mgb2YgdGhlIHNpbWlsYXIgYW5ub3VuY2VtZW50cz/CoDwvZGl2Pjxk
aXY+PGJyPjwvZGl2PjxkaXY+Smlya2E8L2Rpdj48L2Rpdj48ZGl2IGNsYXNzPSJnbWFpbF9leHRy
YSI+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj5PbiBXZWQsIEp1biA2LCAyMDE4IGF0IDM6
NDAgQU0sIFllIFhpYW9sb25nIDxzcGFuIGRpcj0ibHRyIj4mbHQ7PGEgaHJlZj0ibWFpbHRvOnhp
YW9sb25nLnllQGludGVsLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPnhpYW9sb25nLnllQGludGVsLmNv
bTwvYT4mZ3Q7PC9zcGFuPiB3cm90ZTo8YnI+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3Rl
IiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFk
ZGluZy1sZWZ0OjFleCI+PHNwYW4gY2xhc3M9IiI+T24gMDYvMDYsIERhdmUgQ2hpbm5lciB3cm90
ZTo8YnI+CiZndDtPbiBUdWUsIEp1biAwNSwgMjAxOCBhdCAwMzoxNjo1N1BNICswODAwLCBrZXJu
ZWwgdGVzdCByb2JvdCB3cm90ZTo8YnI+CiZndDsmZ3Q7IDxicj4KJmd0OyZndDsgR3JlZXRpbmcs
PGJyPgomZ3Q7Jmd0OyA8YnI+CiZndDsmZ3Q7IEZZSSwgd2Ugbm90aWNlZCBhICs3LjElJSByZWdy
ZXNzaW9uIG9mIGZpby5sYXRlbmN5XzJtcyUgZHVlIHRvIGNvbW1pdDo8YnI+CiZndDsmZ3Q7IDxi
cj4KJmd0OyZndDsgPGJyPgomZ3Q7Jmd0OyBjb21taXQ6IGIwMjdkNGM5N2I5Njc1YzJhZDc1ZGVj
OTRiZTRlNDx3YnI+NmRjZWIzZWM3NCAoJnF1b3Q7eGZzOiBkb24mIzM5O3QgcmV0cnkgeGZzX2J1
Zl9maW5kIG9uIFhCRl9UUllMT0NLIGZhaWx1cmUmcXVvdDspPGJyPgomZ3Q7Jmd0OyA8YSBocmVm
PSJodHRwczovL2dpdC5rZXJuZWwub3JnL2NnaXQvZnMveGZzL3hmcy1saW51eC5naXQiIHJlbD0i
bm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvY2dpdC88
d2JyPmZzL3hmcy94ZnMtbGludXguZ2l0PC9hPiB4ZnMtNC4xOC1tZXJnZTxicj4KJmd0Oy4uLi48
YnI+CiZndDsmZ3Q7IDg5MjVhM2RjNDc3MTAwNGIgYjAyN2Q0Yzk3Yjk2NzVjMmFkNzVkZWM5NGIg
PGJyPgomZ3Q7Jmd0OyAtLS0tLS0tLS0tLS0tLS0tIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
IDxicj4KJmd0OyZndDvCoCDCoCDCoCDCoCDCoCAlc3RkZGV2wqAgwqAgwqAlY2hhbmdlwqAgwqAg
wqAgwqAgwqAlc3RkZGV2PGJyPgomZ3Q7Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIFzCoCDCoCDC
oCDCoCDCoCB8wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgXMKgIDxicj4KJmd0OyZndDvCoCDCoCDC
oCA0Ni41NiDEhcKgIDMlwqAgwqAgwqAgKzcuMcKgIMKgIMKgIMKgNTMuNjHCoCDCoCDCoCDCoCBm
aW8ubGF0ZW5jeV8ybXMlPGJyPgomZ3Q7Jmd0O8KgIMKgIMKgIMKgOC4xOcKgIMKgIMKgIMKgIMKg
IMKgICswLjLCoCDCoCDCoCDCoCA4LjQwwqAgwqAgwqAgwqAgZmlvLmxhdGVuY3lfMTAwbXMlPGJy
PgomZ3Q7Jmd0O8KgIMKgIMKgIMKgMC43NCDEhcKgIDMlwqAgwqAgwqAgLTAuMcKgIMKgIMKgIMKg
IDAuNjggxIXCoCA2JcKgIGZpby5sYXRlbmN5XzI1MG1zJTxicj4KJmd0OyZndDvCoCDCoCDCoCAy
NS4yMCDEhcKgIDYlwqAgwqAgwqAgLTcuM8KgIMKgIMKgIMKgMTcuODYgxIXCoCA2JcKgIGZpby5s
YXRlbmN5XzRtcyU8YnI+CiZndDsmZ3Q7wqAgwqAgwqAgwqAwLjQ2IMSFwqAgOSXCoCDCoCDCoCAr
MC4ywqAgwqAgwqAgwqAgMC42OSDEhSAxMyXCoCBmaW8ubGF0ZW5jeV83NTB1cyU8YnI+CiZndDs8
YnI+CiZndDtUaGlzIGlzIG5vdCBhIHJlZ3Jlc3Npb24uIFRoZSBudW1iZXIgb2YgSU9zIGluIHRo
ZSA0bXMgSU8gbGF0ZW5jeTxicj4KJmd0O2JpbiBoYXMgcmVkdWNlZCBieSA3JSwgYW5kIGludW1i
ZXIgaW4gdGhlIDJtcyBJTyBsYXRlbmN5IGJpbiBoYXM8YnI+CiZndDtpbmNyZWFzZWQgYnkgNyUu
IElPV3MsIHRoZXJlJiMzOTtzIGEgbWVhc3VyYWJsZSBpbXByb3ZlbWVudCBpbiBJTzxicj4KJmd0
O2xhdGVuY3kgYXMgYSByZXN1bHQgb2YgdGhvc2UgcGF0Y2hlcywgbm90IGEgcmVncmVzc2lvbi48
YnI+Cjxicj4KPC9zcGFuPlRoYW5rcyBmb3IgY2xhcmlmaWNhdGlvbi48YnI+Cjxicj4KVGhhbmtz
LDxicj4KWGlhb2xvbmc8YnI+CjxkaXYgY2xhc3M9IkhPRW5aYiI+PGRpdiBjbGFzcz0iaDUiPjxi
cj4KJmd0Ozxicj4KJmd0O0NoZWVycyw8YnI+CiZndDs8YnI+CiZndDtEYXZlLjxicj4KJmd0Oy0t
IDxicj4KJmd0O0RhdmUgQ2hpbm5lcjxicj4KJmd0OzxhIGhyZWY9Im1haWx0bzpkYXZpZEBmcm9t
b3JiaXQuY29tIj5kYXZpZEBmcm9tb3JiaXQuY29tPC9hPjxicj4KPC9kaXY+PC9kaXY+PC9ibG9j
a3F1b3RlPjwvZGl2Pjxicj48L2Rpdj4K

--===============2255905146384404026==--

