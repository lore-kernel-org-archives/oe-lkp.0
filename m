Content-Type: multipart/mixed; boundary="===============8560558950016784871=="
MIME-Version: 1.0
From: Xing Zhengjun <zhengjun.xing@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [mm] 10befea91b: hackbench.throughput -62.4% regression
Date: Thu, 04 Feb 2021 13:19:47 +0800
Message-ID: <8ce56447-b416-4750-eeb3-0d5bb92e007d@linux.intel.com>
In-Reply-To: <20210203024951.GA1837780@carbon.DHCP.thefacebook.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8560558950016784871==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 2/3/2021 10:49 AM, Roman Gushchin wrote:
> On Tue, Feb 02, 2021 at 04:18:27PM +0800, Xing, Zhengjun wrote:
>> On 1/14/2021 11:18 AM, Roman Gushchin wrote:
>>> On Thu, Jan 14, 2021 at 10:51:51AM +0800, kernel test robot wrote:
>>>> Greeting,
>>>>
>>>> FYI, we noticed a -62.4% regression of hackbench.throughput due to com=
mit:
>>> Hi!
>>>
>>> Commit "mm: memcg/slab: optimize objcg stock draining" (currently only =
in the mm tree,
>>> so no stable hash) should improve the hackbench regression.
>> The commit has been merged into Linux mainline :
>>  =C2=A03de7d4f25a7438f09fef4e71ef111f1805cd8e7c ("mm: memcg/slab: optimi=
ze objcg
>> stock draining")
>> I test the regression still existed.
> Hm, so in your setup it's about the same with and without this commit?
>
> It's strange because I've received a letter stating a 45.2% improvement r=
ecently:
> https://lkml.org/lkml/2021/1/27/83

They are different test cases, 45.2% improvement test case run in "thread" =
mode, -62.4% regression test case run in "process" mode.
 From 286e04b8ed7a0427 to 3de7d4f25a7438f09fef4e71ef1 there are two regress=
ions for process mode :
1) 286e04b8ed7a0427 to 10befea91b61c4e2c2d1df06a2e  (-62.4% regression)
2) 10befea91b61c4e2c2d1df06a2e to d3921cb8be29ce5668c64e23ffd (-22.3% regre=
ssion)

3de7d4f25a7438f09fef4e71ef111f1805cd8e7c only fix the regression 2) , so th=
e value of "hackbench.throughput" for 3de7d4f25a7438f09fef4e71ef1(71824) an=
d 10befea91b61c4e2c2d1df06a2e (72220) is very closed.

Regression 1) still existed.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/nr_threads/iterations/mode/ipc/=
cpufreq_governor/ucode:
   lkp-csl-2sp7/hackbench/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3/g=
cc-9/100%/4/process/socket/performance/0x5003003

commit:
   286e04b8ed7a04279ae277f0f024430246ea5eec
   10befea91b61c4e2c2d1df06a2e978d182fcf792
   d3921cb8be29ce5668c64e23ffdaeec5f8c69399
   3de7d4f25a7438f09fef4e71ef111f1805cd8e7c
   v5.11-rc6

286e04b8ed7a0427 10befea91b61c4e2c2d1df06a2e d3921cb8be29ce5668c64e23ffd 3d=
e7d4f25a7438f09fef4e71ef1                   v5.11-rc6
---------------- --------------------------- --------------------------- --=
------------------------- ---------------------------
          %stddev     %change         %stddev     %change         %stddev  =
   %change         %stddev     %change         %stddev
              \          |                \          |                \    =
      |                \          |                \
     192087 =C2=B1  8%     -62.4%      72220 =C2=B1 16%     -70.8%      560=
91 =C2=B1  3%     -62.6%      71824 =C2=B1  2%     -62.4%      72250 =C2=B1=
  2%  hackbench.throughput


> Thanks!
> _______________________________________________
> LKP mailing list --lkp(a)lists.01.org
> To unsubscribe send an email tolkp-leave(a)lists.01.org

-- =

Zhengjun Xing


--===============8560558950016784871==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRl
bnQ9InRleHQvaHRtbDsgY2hhcnNldD1VVEYtOCI+CiAgPC9oZWFkPgogIDxib2R5PgogICAgPGJy
PgogICAgPGJyPgogICAgPGRpdiBjbGFzcz0ibW96LWNpdGUtcHJlZml4Ij5PbiAyLzMvMjAyMSAx
MDo0OSBBTSwgUm9tYW4gR3VzaGNoaW4KICAgICAgd3JvdGU6PGJyPgogICAgPC9kaXY+CiAgICA8
YmxvY2txdW90ZSB0eXBlPSJjaXRlIgogICAgICBjaXRlPSJtaWQ6MjAyMTAyMDMwMjQ5NTEuR0Ex
ODM3NzgwQGNhcmJvbi5ESENQLnRoZWZhY2Vib29rLmNvbSI+CiAgICAgIDxwcmUgY2xhc3M9Im1v
ei1xdW90ZS1wcmUiIHdyYXA9IiI+T24gVHVlLCBGZWIgMDIsIDIwMjEgYXQgMDQ6MTg6MjdQTSAr
MDgwMCwgWGluZywgWmhlbmdqdW4gd3JvdGU6CjwvcHJlPgogICAgICA8YmxvY2txdW90ZSB0eXBl
PSJjaXRlIj4KICAgICAgICA8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPk9uIDEv
MTQvMjAyMSAxMToxOCBBTSwgUm9tYW4gR3VzaGNoaW4gd3JvdGU6CjwvcHJlPgogICAgICAgIDxi
bG9ja3F1b3RlIHR5cGU9ImNpdGUiPgogICAgICAgICAgPHByZSBjbGFzcz0ibW96LXF1b3RlLXBy
ZSIgd3JhcD0iIj5PbiBUaHUsIEphbiAxNCwgMjAyMSBhdCAxMDo1MTo1MUFNICswODAwLCBrZXJu
ZWwgdGVzdCByb2JvdCB3cm90ZToKPC9wcmU+CiAgICAgICAgICA8YmxvY2txdW90ZSB0eXBlPSJj
aXRlIj4KICAgICAgICAgICAgPHByZSBjbGFzcz0ibW96LXF1b3RlLXByZSIgd3JhcD0iIj5HcmVl
dGluZywKCkZZSSwgd2Ugbm90aWNlZCBhIC02Mi40JSByZWdyZXNzaW9uIG9mIGhhY2tiZW5jaC50
aHJvdWdocHV0IGR1ZSB0byBjb21taXQ6CjwvcHJlPgogICAgICAgICAgPC9ibG9ja3F1b3RlPgog
ICAgICAgICAgPHByZSBjbGFzcz0ibW96LXF1b3RlLXByZSIgd3JhcD0iIj5IaSEKCkNvbW1pdCAi
bW06IG1lbWNnL3NsYWI6IG9wdGltaXplIG9iamNnIHN0b2NrIGRyYWluaW5nIiAoY3VycmVudGx5
IG9ubHkgaW4gdGhlIG1tIHRyZWUsCnNvIG5vIHN0YWJsZSBoYXNoKSBzaG91bGQgaW1wcm92ZSB0
aGUgaGFja2JlbmNoIHJlZ3Jlc3Npb24uCjwvcHJlPgogICAgICAgIDwvYmxvY2txdW90ZT4KICAg
ICAgICA8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPlRoZSBjb21taXQgaGFzIGJl
ZW4gbWVyZ2VkIGludG8gTGludXggbWFpbmxpbmUgOgrCoDNkZTdkNGYyNWE3NDM4ZjA5ZmVmNGU3
MWVmMTExZjE4MDVjZDhlN2MgKCJtbTogbWVtY2cvc2xhYjogb3B0aW1pemUgb2JqY2cKc3RvY2sg
ZHJhaW5pbmciKQpJIHRlc3QgdGhlIHJlZ3Jlc3Npb24gc3RpbGwgZXhpc3RlZC4KPC9wcmU+CiAg
ICAgIDwvYmxvY2txdW90ZT4KICAgICAgPHByZSBjbGFzcz0ibW96LXF1b3RlLXByZSIgd3JhcD0i
Ij5IbSwgc28gaW4geW91ciBzZXR1cCBpdCdzIGFib3V0IHRoZSBzYW1lIHdpdGggYW5kIHdpdGhv
dXQgdGhpcyBjb21taXQ/CgpJdCdzIHN0cmFuZ2UgYmVjYXVzZSBJJ3ZlIHJlY2VpdmVkIGEgbGV0
dGVyIHN0YXRpbmcgYSA0NS4yJSBpbXByb3ZlbWVudCByZWNlbnRseToKPGEgY2xhc3M9Im1vei10
eHQtbGluay1mcmVldGV4dCIgaHJlZj0iaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMjEvMS8yNy84
MyI+aHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMjEvMS8yNy84MzwvYT48L3ByZT4KICAgIDwvYmxv
Y2txdW90ZT4KICAgIDxwcmUgaXRlbXByb3A9ImFydGljbGVCb2R5IiBzdHlsZT0iY29sb3I6IHJn
YigwLCAwLCAwKTsgZm9udC1zdHlsZTogbm9ybWFsOyBmb250LXZhcmlhbnQtbGlnYXR1cmVzOiBu
b3JtYWw7IGZvbnQtdmFyaWFudC1jYXBzOiBub3JtYWw7IGZvbnQtd2VpZ2h0OiA0MDA7IGxldHRl
ci1zcGFjaW5nOiBub3JtYWw7IG9ycGhhbnM6IDI7IHRleHQtYWxpZ246IHN0YXJ0OyB0ZXh0LWlu
ZGVudDogMHB4OyB0ZXh0LXRyYW5zZm9ybTogbm9uZTsgd2lkb3dzOiAyOyB3b3JkLXNwYWNpbmc6
IDBweDsgLXdlYmtpdC10ZXh0LXN0cm9rZS13aWR0aDogMHB4OyB0ZXh0LWRlY29yYXRpb24tdGhp
Y2tuZXNzOiBpbml0aWFsOyB0ZXh0LWRlY29yYXRpb24tc3R5bGU6IGluaXRpYWw7IHRleHQtZGVj
b3JhdGlvbi1jb2xvcjogaW5pdGlhbDsiPlRoZXkgYXJlIGRpZmZlcmVudCB0ZXN0IGNhc2VzLCA0
NS4yJSBpbXByb3ZlbWVudCB0ZXN0IGNhc2UgcnVuIGluICJ0aHJlYWQiIG1vZGUsIC02Mi40JSBy
ZWdyZXNzaW9uIHRlc3QgY2FzZSBydW4gaW4gInByb2Nlc3MiIG1vZGUuCkZyb20gMjg2ZTA0Yjhl
ZDdhMDQyNyB0byAzZGU3ZDRmMjVhNzQzOGYwOWZlZjRlNzFlZjEgdGhlcmUgYXJlIHR3byByZWdy
ZXNzaW9ucyBmb3IgcHJvY2VzcyBtb2RlIDoKMSkgMjg2ZTA0YjhlZDdhMDQyNyB0byAxMGJlZmVh
OTFiNjFjNGUyYzJkMWRmMDZhMmUgICgtNjIuNCUgcmVncmVzc2lvbikKMikgMTBiZWZlYTkxYjYx
YzRlMmMyZDFkZjA2YTJlIHRvIGQzOTIxY2I4YmUyOWNlNTY2OGM2NGUyM2ZmZCAoLTIyLjMlIHJl
Z3Jlc3Npb24pCgozZGU3ZDRmMjVhNzQzOGYwOWZlZjRlNzFlZjExMWYxODA1Y2Q4ZTdjIG9ubHkg
Zml4IHRoZSByZWdyZXNzaW9uIDIpICwgc28gdGhlIHZhbHVlIG9mICJoYWNrYmVuY2gudGhyb3Vn
aHB1dCIgZm9yIDNkZTdkNGYyNWE3NDM4ZjA5ZmVmNGU3MWVmMSg3MTgyNCkgYW5kIDEwYmVmZWE5
MWI2MWM0ZTJjMmQxZGYwNmEyZSAoNzIyMjApIGlzIHZlcnkgY2xvc2VkLgoKUmVncmVzc2lvbiAx
KSBzdGlsbCBleGlzdGVkLiAKCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CnRib3hf
Z3JvdXAvdGVzdGNhc2Uvcm9vdGZzL2tjb25maWcvY29tcGlsZXIvbnJfdGhyZWFkcy9pdGVyYXRp
b25zL21vZGUvaXBjL2NwdWZyZXFfZ292ZXJub3IvdWNvZGU6CiAgbGtwLWNzbC0yc3A3L2hhY2ti
ZW5jaC9kZWJpYW4tMTAuNC14ODZfNjQtMjAyMDA2MDMuY2d6L3g4Nl82NC1yaGVsLTguMy9nY2Mt
OS8xMDAlLzQvcHJvY2Vzcy9zb2NrZXQvcGVyZm9ybWFuY2UvMHg1MDAzMDAzCgpjb21taXQ6CiAg
Mjg2ZTA0YjhlZDdhMDQyNzlhZTI3N2YwZjAyNDQzMDI0NmVhNWVlYwogIDEwYmVmZWE5MWI2MWM0
ZTJjMmQxZGYwNmEyZTk3OGQxODJmY2Y3OTIKICBkMzkyMWNiOGJlMjljZTU2NjhjNjRlMjNmZmRh
ZWVjNWY4YzY5Mzk5CiAgM2RlN2Q0ZjI1YTc0MzhmMDlmZWY0ZTcxZWYxMTFmMTgwNWNkOGU3Ywog
IHY1LjExLXJjNgoKMjg2ZTA0YjhlZDdhMDQyNyAxMGJlZmVhOTFiNjFjNGUyYzJkMWRmMDZhMmUg
ZDM5MjFjYjhiZTI5Y2U1NjY4YzY0ZTIzZmZkIDNkZTdkNGYyNWE3NDM4ZjA5ZmVmNGU3MWVmMSAg
ICAgICAgICAgICAgICAgICB2NS4xMS1yYzYKLS0tLS0tLS0tLS0tLS0tLSAtLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIC0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KICAgICAgICAgJXN0ZGRl
diAgICAgJWNoYW5nZSAgICAgICAgICVzdGRkZXYgICAgICVjaGFuZ2UgICAgICAgICAlc3RkZGV2
ICAgICAlY2hhbmdlICAgICAgICAgJXN0ZGRldiAgICAgJWNoYW5nZSAgICAgICAgICVzdGRkZXYK
ICAgICAgICAgICAgIFwgICAgICAgICAgfCAgICAgICAgICAgICAgICBcICAgICAgICAgIHwgICAg
ICAgICAgICAgICAgXCAgICAgICAgICB8ICAgICAgICAgICAgICAgIFwgICAgICAgICAgfCAgICAg
ICAgICAgICAgICBcCiAgICAxOTIwODcgwrEgIDglICAgICAtNjIuNCUgICAgICA3MjIyMCDCsSAx
NiUgICAgIC03MC44JSAgICAgIDU2MDkxIMKxICAzJSAgICAgLTYyLjYlICAgICAgNzE4MjQgwrEg
IDIlICAgICAtNjIuNCUgICAgICA3MjI1MCDCsSAgMiUgIGhhY2tiZW5jaC50aHJvdWdocHV0CgoK
PC9wcmU+CiAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIgogICAgICBjaXRlPSJtaWQ6MjAyMTAy
MDMwMjQ5NTEuR0ExODM3NzgwQGNhcmJvbi5ESENQLnRoZWZhY2Vib29rLmNvbSI+CiAgICAgIDxw
cmUgY2xhc3M9Im1vei1xdW90ZS1wcmUiIHdyYXA9IiI+VGhhbmtzIQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMS1AgbWFpbGluZyBsaXN0IC0tIDxhIGNs
YXNzPSJtb3otdHh0LWxpbmstYWJicmV2aWF0ZWQiIGhyZWY9Im1haWx0bzpsa3BAbGlzdHMuMDEu
b3JnIj5sa3BAbGlzdHMuMDEub3JnPC9hPgpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRv
IDxhIGNsYXNzPSJtb3otdHh0LWxpbmstYWJicmV2aWF0ZWQiIGhyZWY9Im1haWx0bzpsa3AtbGVh
dmVAbGlzdHMuMDEub3JnIj5sa3AtbGVhdmVAbGlzdHMuMDEub3JnPC9hPgo8L3ByZT4KICAgIDwv
YmxvY2txdW90ZT4KICAgIDxicj4KICAgIDxwcmUgY2xhc3M9Im1vei1zaWduYXR1cmUiIGNvbHM9
IjcyIj4tLSAKWmhlbmdqdW4gWGluZzwvcHJlPgogIDwvYm9keT4KPC9odG1sPgo=

--===============8560558950016784871==--

