Content-Type: multipart/mixed; boundary="===============5572980842566991571=="
MIME-Version: 1.0
From: Jan Kara <jack@suse.cz>
To: lkp@lists.01.org
Subject: Re: [ext4] 05c2c00f37: aim7.jobs-per-min -11.8% regression
Date: Thu, 20 May 2021 11:51:19 +0200
Message-ID: <20210520095119.GA18952@quack2.suse.cz>
In-Reply-To: <a8947cee-11f5-8d59-a3ff-1c516276592e@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5572980842566991571==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello!

On Thu 20-05-21 15:13:20, Xing Zhengjun wrote:
> =

> =C2=A0=C2=A0=C2=A0=C2=A0 Do you have time to look at this? The regression=
 still existed in the
> latest Linux mainline v5.13-rc2.

Thanks for verification and for the ping! I had a look into this and I
think the regression is caused by the changes in orphan handling. The load
runs multiple tasks all creating and deleting files. This generally
contends on the orphan locking with fast storage (which is your case
because you use ramdisk as a backing store AFAICT). And the changes I did
move superblock checksum computation under the orphan lock so the lock hold
times are now higher.

Sadly it is not easy to move checksum update from under the orphan lock and
maintain checksum consistency since the checksum has to be recomputed
consistently with the changes of superblock state. But I have one idea how
we could maybe improve the situation. Can you check whether attached patch
recovers the regression? Because that's about how good it could get when we
are more careful when writing out superblock.

								Honza
-- =

Jan Kara <jack@suse.com>
SUSE Labs, CR

--===============5572980842566991571==
Content-Type: text/x-patch
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ext4-Experiment-with-checksum-computation-during-orp.patch"

RnJvbSBmYjc4ODk1NjM4MGUwNjYzMDhlMmEzN2FmYjk3ZDJjNGJlZDQ0ZGU1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKYW4gS2FyYSA8amFja0BzdXNlLmN6PgpEYXRlOiBUaHUsIDIw
IE1heSAyMDIxIDExOjQ2OjAyICswMjAwClN1YmplY3Q6IFtQQVRDSF0gZXh0NDogRXhwZXJpbWVu
dCB3aXRoIGNoZWNrc3VtIGNvbXB1dGF0aW9uIGR1cmluZyBvcnBoYW4KIGhhbmRsaW5nCgpET05U
TUVSR0UuIEp1c3QgZXhwZXJpbWVudCB3aGV0aGVyIHRoaXMgcmVjb3ZlcnMgcGVyZm9ybWFuY2Uu
CgpTaWduZWQtb2ZmLWJ5OiBKYW4gS2FyYSA8amFja0BzdXNlLmN6PgotLS0KIGZzL2V4dDQvbmFt
ZWkuYyB8IDYgKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2ZzL2V4dDQvbmFtZWkuYyBiL2ZzL2V4dDQvbmFtZWkuYwpp
bmRleCBhZmI5ZDA1YTk5YmEuLmJiNjg3ZWQ0YTYwNCAxMDA2NDQKLS0tIGEvZnMvZXh0NC9uYW1l
aS5jCisrKyBiL2ZzL2V4dDQvbmFtZWkuYwpAQCAtMzEwNSw3ICszMTA1LDYgQEAgaW50IGV4dDRf
b3JwaGFuX2FkZChoYW5kbGVfdCAqaGFuZGxlLCBzdHJ1Y3QgaW5vZGUgKmlub2RlKQogCQlORVhU
X09SUEhBTihpbm9kZSkgPSBsZTMyX3RvX2NwdShzYmktPnNfZXMtPnNfbGFzdF9vcnBoYW4pOwog
CQlsb2NrX2J1ZmZlcihzYmktPnNfc2JoKTsKIAkJc2JpLT5zX2VzLT5zX2xhc3Rfb3JwaGFuID0g
Y3B1X3RvX2xlMzIoaW5vZGUtPmlfaW5vKTsKLQkJZXh0NF9zdXBlcmJsb2NrX2NzdW1fc2V0KHNi
KTsKIAkJdW5sb2NrX2J1ZmZlcihzYmktPnNfc2JoKTsKIAkJZGlydHkgPSB0cnVlOwogCX0KQEAg
LTMxMTMsNiArMzExMiw5IEBAIGludCBleHQ0X29ycGhhbl9hZGQoaGFuZGxlX3QgKmhhbmRsZSwg
c3RydWN0IGlub2RlICppbm9kZSkKIAltdXRleF91bmxvY2soJnNiaS0+c19vcnBoYW5fbG9jayk7
CiAKIAlpZiAoZGlydHkpIHsKKwkJbG9ja19idWZmZXIoc2JpLT5zX3NiaCk7CisJCWV4dDRfc3Vw
ZXJibG9ja19jc3VtX3NldChzYik7CisJCXVubG9ja19idWZmZXIoc2JpLT5zX3NiaCk7CiAJCWVy
ciA9IGV4dDRfaGFuZGxlX2RpcnR5X21ldGFkYXRhKGhhbmRsZSwgTlVMTCwgc2JpLT5zX3NiaCk7
CiAJCXJjID0gZXh0NF9tYXJrX2lsb2NfZGlydHkoaGFuZGxlLCBpbm9kZSwgJmlsb2MpOwogCQlp
ZiAoIWVycikKQEAgLTMxOTEsOSArMzE5Myw5IEBAIGludCBleHQ0X29ycGhhbl9kZWwoaGFuZGxl
X3QgKmhhbmRsZSwgc3RydWN0IGlub2RlICppbm9kZSkKIAkJfQogCQlsb2NrX2J1ZmZlcihzYmkt
PnNfc2JoKTsKIAkJc2JpLT5zX2VzLT5zX2xhc3Rfb3JwaGFuID0gY3B1X3RvX2xlMzIoaW5vX25l
eHQpOworCQltdXRleF91bmxvY2soJnNiaS0+c19vcnBoYW5fbG9jayk7CiAJCWV4dDRfc3VwZXJi
bG9ja19jc3VtX3NldChpbm9kZS0+aV9zYik7CiAJCXVubG9ja19idWZmZXIoc2JpLT5zX3NiaCk7
Ci0JCW11dGV4X3VubG9jaygmc2JpLT5zX29ycGhhbl9sb2NrKTsKIAkJZXJyID0gZXh0NF9oYW5k
bGVfZGlydHlfbWV0YWRhdGEoaGFuZGxlLCBOVUxMLCBzYmktPnNfc2JoKTsKIAl9IGVsc2Ugewog
CQlzdHJ1Y3QgZXh0NF9pbG9jIGlsb2MyOwotLSAKMi4yNi4yCgo=

--===============5572980842566991571==--

